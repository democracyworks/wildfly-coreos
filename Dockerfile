FROM jboss/wildfly:8.2.0.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

WORKDIR /opt/jboss/wildfly

USER root
RUN mkdir -p /var/log/remote/wildfly && \
    ln -s /var/log/remote/wildfly standalone/log && \
    chown -R jboss /var/log/remote/wildfly
USER jboss
VOLUME ["/var/log/remote/wildfly"]

COPY standalone.xml standalone/configuration/
COPY start /bin/start

ENTRYPOINT ["/bin/start"]
CMD []
