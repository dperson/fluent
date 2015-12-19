FROM ruby
MAINTAINER David Personette <dperson@dperson.com>

# Install fluentd
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends libcurl4-openssl-dev make \
                $(apt-get -s dist-upgrade|awk '/^Inst.*ecurity/ {print $2}') &&\
    gem install fluentd && \
    fluent-gem install fluent-plugin-elasticsearch && \
    fluent-gem install fluent-plugin-record-reformer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*
COPY fluent.conf /etc/fluent/
COPY fluent.sh /usr/bin/

VOLUME ["/etc/fluent"]

EXPOSE 5140/udp

ENTRYPOINT ["fluent.sh"]
