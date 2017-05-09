from ubuntu:16.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install bind9

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/usr/sbin/named", "-f"]
CMD ["-u", "bind" ]
