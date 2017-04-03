FROM xebialabs/xlr_dev_compile:v6.2.0.1

MAINTAINER Joris De Winne <jdewinne@xebialabs.com>
ENV REFRESHED_AT 2017-04-03

ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/command.sh /opt/xlr/command.sh

CMD ["/usr/bin/supervisord"]