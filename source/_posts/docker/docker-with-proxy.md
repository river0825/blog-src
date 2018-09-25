---
title: Gitlab runner for building docker image installation
categories: docker
tags: [docker,howto]
---

## 錯誤排除

### docker pull error

在 docker pull 的時後遇到

```
Error response from daemon: Get https://registry-1.docker.io/v2/: proxyconnect tcp: dial tcp :80: getsockopt: connection refused
```

這個錯是因為有使用 proxy 的關係。只要進行 proxy 的設定就可以

https://stackoverflow.com/questions/23111631/cannot-download-docker-images-behind-a-proxy

#### docker proxy setup
先建立 docker-service 的設定檔
```bash
$ mkdir /etc/systemd/system/docker.service.d
$ touch /etc/systemd/system/docker.service.d/http-proxy.conf
```

並且設定 HTTP_PROXY 的環境變數
```
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80/"
```

並且可以指定有那些是不需要經過 proxy 的
```
Environment="HTTP_PROXY=http://proxy.example.com:80/"
Environment="NO_PROXY=localhost,127.0.0.0/8,docker-registry.somecorporation.com"
```

寫入設定
``` bash
$ sudo systemctl daemon-reload
```

重啟 docker
```
service docker restart
```

#### docker runner registry

runner config  
[Advanced gitlab runner configuration](https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-runners-docker-section)