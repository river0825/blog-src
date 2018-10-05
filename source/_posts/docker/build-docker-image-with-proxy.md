---
title: Build docker image with proxy
date: 2018-10-04 13:47:10
categories: docker
tags: [ubuntu,apt-get,proxy,docker,dockerfile,howto]
---

因在建置 docker image 的時後處於一個無法直接存取 internet 的環境，必需要透過 proxy 才可以存取

所以必需要設定 proxy 才能夠正常的使用 apt-get 來安裝

以下為做法 

`Dockerfile`
```
ENV LC_ALL C.UTF-8
ENV http_proxy=http://[proxy-ip:proxy-port]
ENV https_proxy=http://[proxy-ip:proxy-port]
RUN echo 'Acquire::http::Proxy "http://[proxy-ip:proxy-port]";' >> /etc/apt/apt.conf
RUN echo 'Acquire::https::Proxy "http://[proxy-ip:proxy-port]";' >> /etc/apt/apt.conf
RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    apt-get install -y language-pack-en-base && \
    add-apt-repository ppa:ondrej/php && \
    apt-get -y php7.1 
```

其中 

http_proxy 是給 add-apt-repository 所使用 

/etc/apt/apt.conf 是在 apt-get 時使用