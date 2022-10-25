# Curl common hacks

## Measure request

- Create a new file, curl-format.txt, and paste in:
```
     time_namelookup:  %{time_namelookup}s\n
        time_connect:  %{time_connect}s\n
     time_appconnect:  %{time_appconnect}s\n
    time_pretransfer:  %{time_pretransfer}s\n
       time_redirect:  %{time_redirect}s\n
  time_starttransfer:  %{time_starttransfer}s\n
                     ----------\n
          time_total:  %{time_total}s\n
````
- Make a request:
` curl -w "@curl-format.txt" -o /dev/null -s "http://wordpress.com/" `

### ~/.curlrc like this

```
-w "\n\n==== cURL measurements stats ====\ntotal: %{time_total} seconds \nsize: %{size_download} bytes \ndnslookup: %{time_namelookup} seconds \nconnect: %{time_connect} seconds \nappconnect: %{time_appconnect} seconds \nredirect: %{time_redirect} seconds \npretransfer: %{time_pretransfer} seconds \nstarttransfer: %{time_starttransfer} seconds \ndownloadspeed: %{speed_download} byte/sec \nuploadspeed: %{speed_upload} byte/sec \n\n"
```
- Example
```
❯❯ curl -I https://google.com
HTTP/2 301
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Mon, 04 Mar 2019 08:02:43 GMT
expires: Wed, 03 Apr 2019 08:02:43 GMT
cache-control: public, max-age=2592000
server: gws
content-length: 220
x-xss-protection: 1; mode=block
x-frame-options: SAMEORIGIN
alt-svc: quic=":443"; ma=2592000; v="44,43,39"



==== cURL measurements stats ====
total: 0.211117 seconds
size: 0 bytes
dnslookup: 0.067179 seconds
connect: 0.098817 seconds
appconnect: 0.176232 seconds
redirect: 0.000000 seconds
pretransfer: 0.176438 seconds
starttransfer: 0.209634 seconds
downloadspeed: 0.000 byte/sec
uploadspeed: 0.000 byte/sec
```
