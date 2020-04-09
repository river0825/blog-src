---
title: Github workflow first try
tags: [github, workflow, git tag, cicd, chrome extension]
date: 2019-12-13 18:10:09
---

## 原由

利用 github workflow 來建制 [gitlab extension](https://github.com/river0825/gitlab-extension-for-chrome)專案

## 目標
- 程式 push 上 github 之後要可以自動執行 build / test 程序
- 有下 tag 的時後，要進行 relase 的程序
- 要將 artifact 變成至 release 的項目之一

## 初始化

- 進入 https://github.com/river0825/gitlab-extension-for-chrome/actions [New workflow] 選擇想要 build 的方案。因為這個專案是使用 typescript, 所以選擇了 nodejs

- 選擇用 softprops/action-gh-release@v1 來當作 release 的工具，設定如下

```yaml
    - name: GH Release
      uses: softprops/action-gh-release@v1
      # 因為只想要在有 tag 的狀況下才 release, 所以要下這個條件
      if: startsWith(github.ref, 'refs/tags/')
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
      # 把 artifact 裡面的檔案變成 relase 的一部份
      # 這裡的寫法有特別找了一下，要用 | 的方式
        files: |
          ./artifact/gitlab-extension.zip
          ./artifact/gitlab-extension.crx
```

[完整設定在這](https://github.com/river0825/gitlab-extension-for-chrome/blob/master/.github/workflows/nodejs.yml)


## 學習點

- git tag 的用法 (add, delete)
- git push --delete origin v1.0.x (刪掉 remote 的 tag)
- 第一次使用 github workflow, 且可以自動 release 

## 遇到的問題
- 想要把產出來的檔案附加上版本號，但目前還無法

## Reference
[Workflow syntax for GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions)