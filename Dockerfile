FROM xebialabs/xlr_dev_compile:v7.2.0.1

MAINTAINER XebiaLabs <info@xebialabs.com>
ENV REFRESHED_AT 2017-10-03

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xlr/command.sh

CMD ["/usr/bin/supervisord"]