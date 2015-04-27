FROM jboss/wildfly:8.2.0.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

COPY ./start /bin/start

ADD standalone-rsyslog.xml /opt/jboss/wildfly/standalone/configuration/standalone-rsyslog.xml

ENTRYPOINT ["/bin/start"]
CMD []
