---
title: Manage data in Docker
date: 2018-10-05 18:37:27
categories: docker
tags: [docker]
---

這一篇是讀 [docker 文件 Manage data in Docker](https://docs.docker.com/storage/) 的整理


- Docker 有兩種方法可以把資料存放在 host machine
    - volumes
    - bind mounts
    - 另外如果你是 Linux 的話，還可以使用 tmpfs



![說明](https://docs.docker.com/storage/images/types-of-mounts.png)
這張圖來自 https://docs.docker.com/storage

- `Volumes` 將資料存放在由 Docker 管理的 filesystem(/var/lib/docker/volumes/ on Linux) , 非 Docker 的程序不應該存取這部份的資料。在 Docker 中這是最佳存放資料的方式。
另外還有提供 volume drivers, 可以將資料存放在 遠端的設備或是 cloud providers.

- `Bind mounts` 直接將 Host machine 中的檔案或是目錄 掛載到 Docker 中

- `tmpfs` 有點像 memory disk, 會將這個 memory disk mount 到 Docker 中。比較常見的用法是將 [secret](https://docs.docker.com/engine/swarm/secrets/#simple-example-get-started-with-secrets) mount 到 服務的container中



## 使用 Volumes 的時機
- 在不同的  container 中共用資料
- 當 Docker hosts 不包證提供固定的檔案目錄結構時
- 當你想把資料放在遠端的設備而不是在本機時 (volume drivers)
- 當你想把資料從一台 docker hosts 備份、回復、合併至另外一台設備時。(/var/lib/docker/volumes/\<volume-name>)

## 使用 Bind mounts 的時機
- 與 Host 一起共用設定檔時，如 `/etc/resolv.conf`
- 共用 source code 或想要取得輸出結果的檔案。比如想要用 docker build 相關的 project. 並取得輸出的結果檔案。
- 當 Host 可保證提供Container可用的目錄結構時

## 使用 tmpfs 的時機
- 當你不想把資料留存在 host 或是在 container 中的時後。
- 當你有一個很大的檔案要處理的時後(tmpfs 使用 memory 為儲存地點)



