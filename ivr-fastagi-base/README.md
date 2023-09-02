# IVR fastAGI Base Container

This is the base container for all IVR fastAGI containers.

`docker build -t ivr-fastagi-base .`

or

`podman build -t ivr-fastagi-base .`

To debug logrotate: edit `/etc/cron.daily/logrotate`
```
/usr/sbin/logrotate -v /etc/logrotate.conf > ~/logrotate.log 2>&1
```
