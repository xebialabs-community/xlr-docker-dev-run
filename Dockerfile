FROM xebialabs/xlr_dev_compile:5.0.1.11

MAINTAINER Joris De Winne <jdewinne@xebialabs.com>
ENV REFRESHED_AT 2016-10-22

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xlr/command.sh

CMD ["/usr/bin/supervisord"]