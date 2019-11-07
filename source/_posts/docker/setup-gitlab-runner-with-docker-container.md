---
title: setup gitlab runner with docker container
categories: docker
tags: [docker,gitlab,devops]
date: 2018-09-25 18:11:45
---

## 目的

建立 可以 build docker image 的 gitlab-runner

## 環境

1. gitlab server
2. registry server
3. gitlab-runner server

## Steps

### 啟用 Gitlab Container Registry 的功能

參考網站

https://docs.gitlab.com/ee/administration/container_registry.html


### 架設 nginx
如果 gitlab 及 registry server 為同一台的話，需要架設 nginx 作為 proxy 來將流量導至不同的 server

範例

https://gitlab.com/gitlab-org/gitlab-ce/blob/master/lib/support/nginx/registry-ssl


另外如果 nginx 與 gitlab 在同一台

### 

執行 gitlab-runner

進入 gitlab-runner 的 contain 命令列中

```
docker exec -it gitlab-runner /bin/bash
```

```
sudo gitlab-runner register -n \
  --url https://gitlab.pchomepay.com.tw/ \
  --registration-token "f8wJTw7m_qV-T_DzEsyq" \
  --executor docker \
  --description "PCPay Docker Runner" \
  --docker-image "docker:latest" \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock
```


```
$ openssl s_client -showcerts -connect gitlab.pchomepay.com.tw:443 </dev/null 2>/dev/null|openssl x509 -outform PEM  > gitlab.pchomepay.com.crt

$ openssl s_client -showcerts -connect registry.pchomepay.com.tw:443 </dev/null 2>/dev/null|openssl x509 -outform PEM  > registry.pchomepay.com.crt

```

[runner.docker]
extrahosts
