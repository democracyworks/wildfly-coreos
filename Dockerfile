FROM jboss/wildfly:8.2.0.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

ENV HOST_IP "TO.BE.FILLED.IN"

COPY ./start /bin/start

ADD standalone-rsyslog.xml /opt/jboss/wildfly/standalone/configuration/standalone-rsyslog.xml

ENTRYPOINT ["/bin/start"]
CMD ["-c", "standalone-rsyslog.xml", "-Djboss.host.name=$HOST_IP", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
