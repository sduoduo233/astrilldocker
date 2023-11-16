# Astrill in docker
Running astrill in docker

# Features
- Run on any OS with docker support
- No privileged container required
- Expose as a socks5 server
- Support OpenWeb, StealthVPN and WireGuard
- Manage Astrill remotely using VNC
- Tested in China

# How to build
1. Clone this project

2. Download `astrill-setup-linux64.deb` to `./data/astrill-setup-linux64.deb` from [Astrill official website](https://www.astrill.com/download/linux)

3. Download [https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img](https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img) to `./data/jammy-server-cloudimg-amd64.img`

4. Run `docker build .`

# How to use
1. Build the image

2. `docker run -p 5905:5905 -p 5902:5902 -p 7890:7890 [docker image id]`

3. Use any VNC client (e.g. Remmina on linux) to connect 127.0.0.1:5905 with password `astrill`

4. Use `127.0.0.1:7890` for socks5 proxy on your host o
```
curl --proxy socks5://127.0.0.1:7890 myip.wtf/json
```

# Exposed ports
| port | usage |
| ---- | ----- |
| 5905 | ubuntu vnc (password `astrill`) |
| 5902 | qemu vnc |
| 7890 | socks5 |