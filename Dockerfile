FROM ubuntu:21.10

RUN apt update
RUN apt install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    dnsutils \
    iputils-ping \
    telnet

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

RUN curl https://baltocdn.com/helm/signing.asc | apt-key add - && \
    apt-get install apt-transport-https --yes && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install helm
