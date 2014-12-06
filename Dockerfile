# RUBY MACHINE
FROM tscolari/base
MAINTAINER Tiago Scolari <tscolari@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV MEMORY 100

RUN apt-get update && \
    apt-get install memcached -y --force-yes && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 11211
CMD nginx

CMD ["-m", "$MEMORY", "-p", "11211", "-U", "11211"]

USER nobody
ENTRYPOINT memcached
