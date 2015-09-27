# WildFly CoreOS

> A Docker image + supporting infrastructure for running WildFly on CoreOS

## Usage

`fleetctl submit wildfly@.service`

`fleetctl start wildfly@1` incrementing the number after `@` for each instance you'd like to start

## Building

`docker build -t my-wildfly-coreos .`

### Debug build

If you want debug level logging...

1. Run the build command above.
1. Change the FROM line in `Dockerfile.debug` to match the image tag you used in step 1.
1. Run `docker build -f Dockerfile.debug -t my-debug-wildfly .`.

## Docker Repo

This image lives at `quay.io/democracyworks/wildfly-coreos`
