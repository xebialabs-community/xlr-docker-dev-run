FROM xebialabs/xlr_dev_compile:v7.1.0.3

MAINTAINER XebiaLabs <info@xebialabs.com>
ENV REFRESHED_AT 2017-08-24

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xlr/command.sh

CMD ["/usr/bin/supervisord"]