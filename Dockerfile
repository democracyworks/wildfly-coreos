FROM jboss/wildfly:9.0.2.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

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

# Re-enable SSLv3 for now because CA OVR API requires it.
# TODO: Undo this as soon as they fix that. SSLv3 is insecure.
RUN sed -ie 's/SSLv3, //' /usr/lib/jvm/java/jre/lib/security/java.security

USER jboss

EXPOSE 9990

ENTRYPOINT ["/bin/start"]
CMD []
