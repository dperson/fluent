[![logo](https://raw.githubusercontent.com/dperson/fluent/master/logo.png)](https://www.fluentd.org/)

# Fluent

Fluent docker container

# What is Fluent?

Fluentd is an open source data collector, which lets you unify the data
collection and consumption for a better use and understanding of data.

# How to use this image

When started Fluent container will listen on port 5140/udp.

## Hosting a Fluent instance

    sudo docker run -d dperson/fluent

## Configuration

    sudo docker run -it --rm dperson/fluent -h

    Usage: fluent.sh [-opt] [command]
    Options (fields in '[]' are optional, '<>' are required):
        -h          This help
        -t ""       Configure timezone
                    possible arg: "[timezone]" - zoneinfo timezone for container

    The 'command' (if provided and valid) will be run instead of fluentd

ENVIROMENT VARIABLES (only available with `docker run`)

 * `TZ` - As above, set a zoneinfo timezone, IE `EST5EDT`

## Examples

Any of the commands can be run at creation with `docker run` or later with
`docker exec fluent.sh` (as of version 1.3 of docker).

### Setting the Timezone

    sudo docker run -p 5140:5140/udp -d dperson/fluent -t EST5EDT

OR using `environment variables`

    sudo docker run -p 5140:5140/udp -e TZ=EST5EDT -d dperson/fluent

Will get you the same settings as

    sudo docker run --name fluent -p 5140:5140/udp -d dperson/fluent
    sudo docker exec fluent fluent.sh -t EST5EDT ls -AlF /etc/localtime
    sudo docker restart fluent

## Complex configuration

[Example configs](http://docs.fluentd.org/articles/quickstart)

If you wish to adapt the default configuration, use something like the following
to copy it from a running container:

    sudo docker cp fluent:/etc/fluent /some/path

You can use the modified configuration with:

    sudo docker run --name es -p 5140:5140/udp -v /some/path:/etc/fluent:ro \
                -d dperson/fluent

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/dperson/fluent/issues).
