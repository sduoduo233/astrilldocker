# Astrill in docker
Running astrill in docker

# Features
- Run on any OS with docker support
- No privileged container required
- Expose as a socks5 server
- Support OpenWeb StealthVPN WireGuard
- Manage Astrill remotely using VNC

# How to build

1. clone this project
2. download [https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img](https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img) into `./data/jammy-server-cloudimg-amd64.img`
3. `docker build .`
