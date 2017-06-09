FROM xebialabs/xlr_dev_compile:v7.0.0.1

MAINTAINER XebiaLabs <info@xebialabs.com>
ENV REFRESHED_AT 2017-06-08

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xlr/command.sh

CMD ["/usr/bin/supervisord"]