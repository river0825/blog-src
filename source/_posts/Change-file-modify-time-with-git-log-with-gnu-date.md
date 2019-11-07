---
title: Change file modify time with git log with gnu date
date: 2019-11-08 20:12:00 
tags: []
---

## 原由

使用 circle ci 來進行 hexo 發佈時，hexo 會用 檔案時間來當作 發佈時間

git pull 並無法保留 檔案時間，所以才去找了該如何以 git log 進行修改

## 解決方案

方法 1. 
```bash
#!/usr/bin/env bash
IFS="
"
for FILE in $(git ls-files)
do
    TIME=$(git log --pretty=format:%cd -n 1 --date=iso -- "$FILE")
    TIME=$(date -j -f '%Y-%m-%d %H:%M:%S %z' "$TIME" +%Y%m%d%H%M.%S)
    echo $TIME $FILE 
    touch -m -t "$TIME" "$FILE"
done
```

結果 circle-ci 上的 docker image 用的是 gnu date, 沒有 -j 的參數

!!失敗!!

```bash
#!/usr/bin/env bash
IFS="
"
for FILE in $(git ls-files)
do
    TIME=$(git log --pretty=format:%cd -n 1 --date=iso -- "$FILE")
    echo $TIME $FILE
    read Y M D h i s t -d ' ' <<<  ${TIME//[-:+]/ }
    TIME1="$Y$M$D$h$i.$s"
    echo $TIME1 $FILE 
    touch -m -t "${TIME1}" "$FILE"
done
```

結果 circle-ci 上的 docker image 裡執行的時後無法正確的把資料讀進每個參數中

!!失敗!!

```bash
#!/usr/bin/env bash
IFS="
"
for FILE in $(git ls-files)
do
    TIME=$(git log --pretty=format:%cd -n 1 --date=iso -- "$FILE")
    # echo $TIME $FILE
    TIME1=$(echo ${TIME//[-:+]/ } | awk -F ' ' '{print $1$2$3$4$5"."$6}')
    echo $TIME $FILE
    touch -m -t "${TIME1}" "$FILE"
done
```

最後用了 awk 才成功

---
## 但其實不用這麼麻煩

在 markdown 檔頭加入 `date: {{ date }}` 指定寫作的時間就行了

修改 scaffolds 中的檔案，下次 new 新的 寫作就不會再缺少這個設定

可惡，浪費我 3 個小時生命!!
