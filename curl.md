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
