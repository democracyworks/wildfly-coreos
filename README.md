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

### NewRelic build

If you want NewRelic built in...

1. Run the build command(s) above (whichever build(s) you want the newrelic one based on).
1. Change the FROM line in `Dockerfile.newrelic` to match the image tag you want it based on.
1. Download and configure the NewRelic Java agent and put everything in a `newrelic` directory at the root of this build. It will be picked up and copied into the Docker image in the next step.
1. Run `docker build -f Dockerfile.newrelic -t my-newrelic-wildfly .`.

## Docker Repo

This image lives at `quay.io/democracyworks/wildfly`
