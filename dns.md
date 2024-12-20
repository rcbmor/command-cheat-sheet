# Install:
# apt-get install dnsutils

# Query Google
dig @8.8.8.8 jvns.ca

# Get nameserver responsible for domain name
dig @1.1.1.1 +short NS example.com

# Reverse DNS
dig -x $ip
dig ptr $ip

# Only print answer section
dig +noall +answer ns google.com

# Only show records
dig +short ns google.com

# Mimic what DNS resolvers do
dig +trace $domain

# Get only certain query type
dig $domain txt
dig $domain SOA

# Also check: nslookup, host
# dog https://github.com/ogham/dog


# Get statistics about DNS cache
sudo systemd-resolve --statistics

# Empty DNS cache
sudo resolvectl flush-caches  # or:
sudo systemd-resolve --flush-caches

# Get DNS config
scutil --dns

# Check DNS propagation
https://www.whatsmydns.net/#A/example.org
https://www.whatsmydns.net/#CNAME/example.org

