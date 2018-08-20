ARG xlr_tag
FROM xebialabsunsupported/xlr_dev_compile:$xlr_tag

MAINTAINER XebiaLabs <info@xebialabs.com>

ADD resources/command.sh /opt/xlr/command.sh