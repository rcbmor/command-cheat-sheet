# TLS / SSL

## RSA and ECC

- RSA and ECC are public key cryptography algorithms.
- RSA is for encryption and digital signing.
- ECDSA is just for digital signing.
- RSA process factors the product of two large numbers.
- ECC process finds the discrete logratihm between points on a elliptic curve.

### Key sizes

| Symmetric Key length |  RSA key length |   ECC key length   | 
|----------------------|-----------------|--------------------|
| 80                   | 1024            | 160                |
| 112                  | 2048            | 224                |
| 128                  | 3072            | 256                |
| 192                  | 7680            | 384                |
| 256                  | 15360           | 512                |

```
$ openssl speed ecdsap256 rsa2048
...
                              sign    verify    sign/s verify/s
rsa 2048 bits              0.001717s 0.000078s    582.3  12869.1
                              sign    verify    sign/s verify/s
256 bit ecdsa (nistp256)   0.0005s   0.0003s     2025.7   3115.6

```

For example: 256-bit ECC Key is equivalent to a 2048-bit RSA key and gives 128-bit security.
- (+) ECC uses smaller keys and certificate size, faster TLS handshakes, better performance.
- (+) ECC offers a stronger algorithm, harder to break, scales better. RSA needs to increase key sizes to provide more security.
- (-) ECC is less mature than RSA.
- (-) ECC is faster for signing but slower for signature verification.

# Openssl

```
# Generate RSA key at a given length:
openssl genrsa -out example.key 2048
```

```
#Generate EC key with a given curve:
openssl ecparam -genkey -name secp384r1 | openssl ec -out ec.key
```

```
#Generate a CSR from existing private key with a given subject info:
openssl req -new  -key example.key -out example.csr -subj "/CN=example.com" -sha256
```

# Nginx configuration
```
server {
  listen 443 ssl default_server;
  server_name example.site www.example.site;
  # RSA certificates
  ssl_certificate /var/ssl/example.site/certs/fullchain.rsa.pem;        
  ssl_certificate_key /var/ssl/example.site/private/privkey.rsa.pem;
  # ECDSA certificates
  ssl_certificate /var/ssl/example.site/certs/fullchain.ecc.pem;        
  ssl_certificate_key /var/ssl/example.site/private/privkey.ecc.pem; 
  # Other directives
  ssl_prefer_server_ciphers on;
  # prefer ECDSA over RSA
  ssl_ciphers "EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH:DHE+AESGCM:DHE:!RSA!aNULL:!eNULL:!LOW:!RC4:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!CAMELLIA:!SEED";
}

```
# How to test/show certificates

```
# Test with ECDSA cipher
$ openssl s_client -host example.site -port 443 -cipher ECDHE-ECDSA-AES128-GCM-SHA256 2>&1 < /dev/null | \
    sed -n '/-----BEGIN/,/-----END/p' | \
    openssl x509 -noout -text -fingerprint -sha256
```
```
# Test with RSA cipher
openssl s_client -host example.site -port 443 -cipher ECDHE-RSA-AES128-GCM-SHA256 2>&1 < /dev/null | \
    sed -n '/-----BEGIN/,/-----END/p' | \
    openssl x509 -noout -text -fingerprint -sha256

```
# Extract certificates

## Only the certificate:
```
echo | openssl s_client -connect example.com:443 2>&1 | sed --quiet '/-BEGIN ↩
CERTIFICATE-/,/-END CERTIFICATE-/p' > example.crt
```

## Chain (-showcerts)
```
echo | openssl s_client -showcerts -connect example.com:443 2>&1 | sed --quiet ↩
'/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > example.chain
```

# Check fingerprints
```
echo | openssl s_client -connect example.com:443 2>&1 | openssl x509 -noout ↩
-fingerprint -sha256 | sed 's/://g' | tr '[:upper:]' '[:lower:]' | sed 's/sha256 ↩
fingerprint=//g'
```
# Testing Cipher Suite Configuration
```
# TLS_AES_128_GCM_SHA256
echo | openssl s_client -connect example.com:443 -tls1_3 -ciphersuites TLS_AES↩
_128_GCM_SHA256 2>/dev/null| grep New

# AESGCM
echo | openssl s_client -connect example.com:443 -no_tls1_3 -cipher AESGCM ↩
2>/dev/null | grep New

```

# Testing Cipher Suite Preference
```
# initiate two connections, first offering one of the suites as your first choice, then the other:

echo | openssl s_client -connect example.com:443 -tls1_3 -ciphersuites 'TLS_AES↩
_128_GCM_SHA256:TLS_AES_256_GCM_SHA384' 2>/dev/null | grep New
New, TLSv1.3, Cipher is TLS_AES_128_GCM_SHA256

echo | openssl s_client -connect example.com:443 -tls1_3 ↩
-ciphersuites 'TLS_AES_256_GCM_SHA384:TLS_AES_128_GCM_SHA256' 2>/dev/null | grep New
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384

```
* If you see the same suite negotiated on both connections, that means that the server is configured to actively select negotiated suites. Otherwise, it isn’t.

```
echo | openssl s_client -connect example.com:443 -no_tls1_3 -cipher ↩
'ECDHE+AESGCM RSA' 2>/dev/null | grep New
New, TLSv1.2, Cipher is ECDHE-ECDSA-AES128-GCM-SHA256

echo | openssl s_client -connect example.com:443 -no_tls1_3 -cipher ↩
'ECDHE+AESGCM RSA +ECDHE' 2>/dev/null | grep New
New, TLSv1.2, Cipher is ECDHE-ECDSA-AES128-GCM-SHA256

```

# References:
- Seriously, stop using RSA https://blog.trailofbits.com/2019/07/08/fuck-rsa/
- https://www.feistyduck.com/library/openssl-cookbook/online/ch-testing-with-openssl.html

