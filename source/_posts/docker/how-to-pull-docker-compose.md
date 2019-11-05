---
title: How to pull docker/compose
date: 2019-11-05 23:23:42
tags: [docker,gitlab-ci.yml,howto]    
---

當你想在 ci 中使用 docker-compose 來建立 image 的時後會 無法 pull docker/compose 這個 images

```bash
$ docker pull docker/compose
Using default tag: latest
Error response from daemon: manifest for docker/compose:latest not found: manifest unknown: manifest unknown
```

在 overview 中的 pull command 是騙人的，根本無法下載

原來 docker/compose 沒有 latest 這個 tag

查了一下 docker/compose 有的 tag

https://hub.docker.com/r/docker/compose/tags

使用這裡的 tag 來下載就行了

```
docker pull docker/compose:1.24.1
```

成功!!
