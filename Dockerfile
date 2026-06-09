FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
      openssh-server \
      tini \
      ca-certificates \
      bash-completion \
      less nano vim-tiny \
      curl wget \
      iputils-ping iproute2 net-tools \
      procps psmisc \
      tree file \
      python3 \
      figlet \
      coreutils findutils grep \
    && rm -rf /var/lib/apt/lists/*

# --- SSH server hardening ----------------------------------------------------
RUN mkdir -p /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?UsePAM.*/UsePAM yes/' /etc/ssh/sshd_config && \
    echo "PrintMotd no" >> /etc/ssh/sshd_config && \
    echo "PrintLastLog no" >> /etc/ssh/sshd_config

# --- The student user --------------------------------------------------------
RUN useradd -m -s /bin/bash hacker && \
    echo 'hacker:hacker' | chpasswd

# --- Stage all CTF content into /opt/ctf ------------------------------------
COPY content/ /opt/ctf/
RUN chmod +x /opt/ctf/start.sh /opt/ctf/install.sh /opt/ctf/bin/* /opt/ctf/checks/*.sh

# Install: lays down challenges into /home/hacker, sets bashrc, motd, etc.
RUN /opt/ctf/install.sh

EXPOSE 22

# tini reaps zombies from any child process under sshd
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/opt/ctf/start.sh"]
