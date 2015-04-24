FROM jboss/wildfly:8.2.0.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

# work around bug where >1 app causes errors like:
# org.jboss.msc.service.DuplicateServiceException: Service jboss.pojo.\"org.jboss.netty.internal.LoggerConfigurator\".DESCRIBED is already registered"
RUN sed -i '/pojo/d' /opt/jboss/wildfly/standalone/configuration/standalone.xml


COPY ./start /bin/start

ENTRYPOINT ["/bin/start"]
CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
