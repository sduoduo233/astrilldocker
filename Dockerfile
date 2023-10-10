# ========== BUILD ==========
FROM ubuntu:22.04 AS builder

WORKDIR /app

# update packages & install qemu
RUN apt update && apt upgrade -y && apt install -y qemu-system-x86 python3

COPY ./data/* ./

# resize ubuntu disk image
RUN qemu-img resize ./jammy-server-cloudimg-amd64.img +5G

# initialize ubuntu vm (install astrill, vnc and v2ray)
RUN /app/entrypoint.sh

# ========== RUN ==========
FROM ubuntu:22.04

WORKDIR /app

RUN apt update && apt upgrade -y && apt install -y qemu-system-x86 python3

# copy vm image from build stage
COPY --from=builder /app/jammy-server-cloudimg-amd64.img ./
COPY --from=builder /app/meta-data ./
COPY --from=builder /app/user-data ./
COPY --from=builder /app/vendor-data ./
COPY --from=builder /app/entrypoint.sh ./

EXPOSE 5905
EXPOSE 5902
EXPOSE 7890

CMD /app/entrypoint.sh
