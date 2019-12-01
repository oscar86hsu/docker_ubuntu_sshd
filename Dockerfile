FROM ubuntu:16.04
MAINTAINER Oscar Hsu "https://github.com/oscar86hsu"

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN mkdir -p ~/.ssh
RUN echo 'root:root' | chpasswd
RUN sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/.*PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]