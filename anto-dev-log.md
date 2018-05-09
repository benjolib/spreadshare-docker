Antonio Development log
=

May 8th, 2018
-------------

* Spent a while trying to solve a problem with the backend container.
    * The `start-daemons` script had a wrong line, preventing the container to start correctly.

* Trying to solve error: `fopen(/project/application/system/log/application): failed to open stream: Permission denied`
    * Looks like the log files don't have a proper owner. Finding out why...
        * There was a typo in the `APPLICATION_LOGS` environment variable definition
        
May 9th, 2018
-------------
* Trying to solve error: `Service unavailable, the server is temporarily unable to service your request due to maintenance downtime or capacity problems. Please try again later.`
> [Wed May 09 07:29:22.641744 2018] [proxy_fcgi:error] [pid 155:tid 140240559003392] [client 172.18.0.1:60048] AH01067: Failed to read FastCGI header
>
> [Wed May 09 07:29:22.641776 2018] [proxy_fcgi:error] [pid 155:tid 140240559003392] (104)Connection reset by peer: [client 172.18.0.1:60048] AH01075: Error dispatching request to :81:
> 
> docker.vm:80 172.18.0.1 - - [09/May/2018:07:29:22 +0000] "GET / HTTP/1.1" 503 573 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:59.0) Gecko/20100101 Firefox/59.0"
>
> [httpd:access] dev.spreadshare.co:80 172.18.0.1 - - [09/May/2018:07:29:22 +0000] "GET / HTTP/1.1" 503 bytesIn:363 bytesOut:573 reqTime:0
>
> [09-May-2018 07:29:22] WARNING: [pool www] child 389 exited on signal 4 (SIGILL - core dumped) after 764.010912 seconds from start
>
> [09-May-2018 07:29:22] NOTICE: [pool www] child 891 started

* * Restarting the `php-fpm` service doesn't solve anything
  * Making a dump on the `public/index.php` works, so it must be a bug in the code, not in configuration.
  
    
