Squid HTTP proxy combined with Zerotier network for outgoing traffic

# How To Run with Docker
1. Start container 
  1. with a mount in container at `/var/lib/zerotier-one`
  1. with additional options:
    `--init --dns=8.8.8.8 --cap-add=NET_ADMIN --cap-add=SYS_ADMIN --device=/dev/net/tun`
  1. with extra commands to allow clients on local network:
    `ip route add 192.168.0.0/24 via 172.17.0.1`
1. Connect to Zerotier network
  1. `docker exec -it <container-name-or-id> bash`
  1. `zerotier-cli join <network-id>`
  1. `zerotier-cli set <network-id> allowDefault=1` 
1. Squid proxy runs on port 3128

