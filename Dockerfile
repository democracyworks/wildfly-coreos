FROM jboss/wildfly:8.2.1.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

WORKDIR /opt/jboss/wildfly

USER root
RUN mkdir -p /var/log/remote/wildfly && \
    ln -s /var/log/remote/wildfly standalone/log && \
    chown -R jboss /var/log/remote/wildfly
VOLUME ["/var/log/remote/wildfly"]

COPY standalone.xml standalone/configuration/
RUN chown -R jboss standalone/configuration
COPY start /bin/start
RUN chown jboss /bin/start && chmod +x /bin/start
USER jboss

EXPOSE 9990

ENTRYPOINT ["/bin/start"]
CMD []
