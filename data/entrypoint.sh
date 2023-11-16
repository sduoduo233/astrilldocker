#/bin/bash

# wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

python3 -m http.server -b 127.0.0.1 &

qemu-system-x86_64 -netdev user,id=net,hostfwd=tcp::5905-:5905,hostfwd=tcp::7890-:7890,dns=8.8.8.8 -device virtio-net,netdev=net -m 512 -hda jammy-server-cloudimg-amd64.img -smbios type=1,serial=ds='nocloud;s=http://10.0.2.2:8000/' -display vnc=:2 -nographic
