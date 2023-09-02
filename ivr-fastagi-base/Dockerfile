FROM ubuntu
WORKDIR   /root

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
&& apt-get install -y --no-install-recommends nano inetutils-ping tzdata \
&& ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime

RUN apt-get install -y --no-install-recommends \
cron logrotate curl openjdk-11-jre-zero exim4-base- \
&& apt-get clean

COPY  .  .

RUN  chmod 644 logrotate.d/* \
&& mv -f logrotate.d/* /etc/logrotate.d && rmdir logrotate.d/ \
&& ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime \
&& rm /etc/cron.daily/apt* \
&& mkdir /var/log/fastagi \
&& ln -s /var/log/fastagi ~/log \
&& sed -i 's/25 6/55 23/' /etc/crontab

ENTRYPOINT  ["./app/startup.sh"]
