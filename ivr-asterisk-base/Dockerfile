FROM ubuntu
WORKDIR   /root

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
&& apt-get install -y --no-install-recommends nano inetutils-ping tzdata \
&& ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime

RUN apt-get install -y --no-install-recommends \
cron logrotate asterisk unixodbc odbc-postgresql libttspico-utils \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /etc/alternatives/asterisk-prompt-en/ \
&& rm -rf /usr/share/asterisk/sounds/en_US \
&& rm -rf /usr/share/asterisk/sounds/en \
&& rm -rf /usr/share/asterisk/sounds/en_US_f_Allison/

COPY  .  .

RUN rm /etc/cron.daily/apt* \
&& ln -s /var/log/asterisk ~/log \
&& sed -i 's/25 6/55 23/' /etc/crontab

ENTRYPOINT  ["./startup.sh"]
