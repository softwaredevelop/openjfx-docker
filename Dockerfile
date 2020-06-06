ARG MAVEN_VERSION

FROM maven:${MAVEN_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    git \
    pwgen \
    openssh-client \
    openjfx \
    libxtst-dev \
    libxext-dev \
    libxrender-dev \
    libfreetype6-dev \
    libfontconfig1 \
    libgtk2.0-0 \
    libxslt1.1 \
    libxxf86vm1 \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

ARG USERMAIL
ARG USER

RUN mkdir --parents /root/.ssh && touch /root/.ssh/passphrase_docker \
    && pwgen -s 11 -1 > /root/.ssh/passphrase_docker && touch /root/.ssh/config \
    && ssh-keygen -t rsa -b 4096 -N $(cat /root/.ssh/passphrase_docker) -C "${USERMAIL}" -f /root/.ssh/id_rsa_docker \
    && git config --global user.name ${USER} \
    && git config --global user.email ${USERMAIL}

#USER ${UID_NAME}

#WORKDIR /home/${UID_NAME}/data

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["bash"]
