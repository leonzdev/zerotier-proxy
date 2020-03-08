FROM ubuntu:18.04 

RUN apt-get update && apt-get install -y curl gnupg bash squid

# zerotier
RUN curl -s https://install.zerotier.com | bash

# ZeroTier relies on UDP port 9993
EXPOSE 9993/udp

RUN mkdir -p /var/lib/zerotier-one

COPY ./main.sh /main.sh
RUN chmod 0755 /main.sh

ENTRYPOINT ["/main.sh"]

