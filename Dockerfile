FROM ubuntu:bionic

RUN apt update && \
DEBIAN_FRONTEND=noninteractive \
apt install -y \
  make unrar-free autoconf automake libtool gcc g++ gperf \
  flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
  sed git unzip bash help2man wget bzip2 libtool-bin && \
  apt-get clean  && \
  rm -Rf /var/lib/apt/lists/*

ENV USER=builder USER_ID=1000 USER_GID=1000

# now creating user
RUN groupadd --gid "${USER_GID}" "${USER}" && \
    useradd \
      --uid ${USER_ID} \
      --gid ${USER_GID} \
      --create-home \
      --shell /bin/bash \
      ${USER}

USER builder

WORKDIR /data
CMD ['make']
