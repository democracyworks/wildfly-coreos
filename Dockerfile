FROM jboss/wildfly:8.2.0.Final
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

COPY ./start /bin/start

ENTRYPOINT ["/bin/start"]
CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
