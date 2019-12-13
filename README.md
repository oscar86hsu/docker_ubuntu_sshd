# docker_ubuntu_sshd
Dockerized SSH service, built on top of [official Ubuntu](https://hub.docker.com/_/ubuntu) images.

## Image tags

- oscar86hsu/ubuntu-sshd:14.04 (trusty)
- oscar86hsu/ubuntu-sshd:16.04 (xenial)
- oscar86hsu/ubuntu-sshd:18.04 (bionic)

## Installed packages

Base:

- [Trusty (14.04) minimal](http://packages.ubuntu.com/trusty/ubuntu-minimal)
- [Xenial (16.04) minimal](http://packages.ubuntu.com/xenial/ubuntu-minimal)
- [Bionic (18.04) minimal](http://packages.ubuntu.com/bionic/ubuntu-minimal)

Package:

- [openssh-server](https://packages.debian.org/zh-tw/jessie/openssh-server)

Default Config:

- `PermitRootLogin yes`
- `PasswordAuthentication yes`
- exposed port 22
- default command: `/usr/sbin/sshd -D`
- root password: `root`

## Getting Started
`docker run -d -p 2222:22 --name ubuntu_sshd oscar86hsu/ubuntu_sshd:latest`<br>
`ssh root@localhost -p2222`

## Security

Using the image with the default password is dangerous. You should change your password after creating the container.<br>
- To change password, use the following command:
`docker exec -ti ubuntu_sshd passwd`

- To not use password and use key instead:<br>
```
docker exec ubuntu_sshd passwd -d root
docker exec ubuntu_sshd sed -i 's/.*PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
ssh-keygen -t rsa -f ./id_rsa -N ""
docker cp id_rsa.pub ubuntu_sshd:/root/.ssh/authorized_keys
docker exec ubuntu_sshd chown root:root /root/.ssh/authorized_keys
```

## Useful Links
- [ssh-keygen](https://www.ssh.com/ssh/keygen/)
- [Docker Document](https://docs.docker.com/)


