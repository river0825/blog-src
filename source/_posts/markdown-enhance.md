---
title: Mark Down Enhance with Gitlab
date: 2018-10-08 11:11:43
tags: ["markdown"]
presentation:
  width: 960
  height: 700
  enableSpeakerNotes: true
  controls: true
  parallaxBackgroundImage: './reveal-parallax-1.jpg'
  parallaxBackgroundSize: '2100px 900px'
---


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Atom ＋ Markdown Enhance + Gitlab](#atom-markdown-enhance-gitlab)
* [Why? 為何?](#why-為何)
* [大概是怎樣呢?](#大概是怎樣呢)
    * [atom 編輯](#atom-編輯)
    * [git 版控](#git-版控)
    * [gitlab server 分享](#gitlab-server-分享)
* [功能 demo](#功能-demo)
  * [其他的 Markdown 語法](#其他的-markdown-語法)
  * [功能 - 畫UML 1](#功能-畫uml-1)
  * [功能 - 畫UML 2](#功能-畫uml-2)
  * [寫 slide](#寫-slide)
  * [寫 slide 的相關文件](#寫-slide-的相關文件)
  * [功能 - 數學算式](#功能-數學算式)
* [安裝說明](#安裝說明)
* [安裝說明 - Plantuml](#安裝說明-plantuml)
    * [下載 plantuml](#下載-plantumlhttpplantumlcomdownload)
    * [安裝 GraphVis](#安裝-graphvis)
    * [Test](#test)
* [如何將 寫好的文件放至 gitlab 上](#如何將-寫好的文件放至-gitlab-上)
  * [找到 或 建立 專案](#找到-或-建立-專案)
  * [把 wiki clone 到 本機上](#把-wiki-clone-到-本機上)
  * [編輯完了要放上 Server](#編輯完了要放上-server)
* [Q&A](#qa)

<!-- tocstop -->

<!-- slide-->
# Atom ＋ Markdown Enhance + Gitlab

*River*

2017-05-24

<!-- slide -->

# Why? 為何?

* 專注於 內容
* 語法簡單
* 可版控
* 多人協作
* 畫圖
* 簡報

<!-- slide -->

# 大概是怎樣呢?

### atom 編輯
* 編輯你的 檔案
* live view

###  git 版控
* commit 每次的編輯
* 將編輯後的文件 push 上 server

### gitlab server 分享
* project wiki

<!-- slide -->
# 功能 demo
github: https://github.com/shd101wyy/markdown-preview-enhanced
詳細文件: https://shd101wyy.github.io/markdown-preview-enhanced/#/

  <strong>Markdown 基本語法</strong>
  ```
  #    -> 標題1
  ##   -> 標題2
  ###  -> 標題3
  #### -> 標題4
  ```

<!-- slide -->

## 其他的 Markdown 語法

去看文件啦~~

[文件底甲](https://shd101wyy.github.io/markdown-preview-enhanced/#/markdown-basics)

<!-- slide -->
## 功能 - 畫UML 1

* 畫 UML [語法看這](http://plantuml.com/)
<div class = "slide-2col-left">

Sequence Diagram

```plantuml
actor Alice

Alice -> Nana
Nana -> James
Nana -> James : new feature
```
</div>


<div class = "slide-2col-right">
Activity Diagram

```plantuml
start

if (Graphviz installed?) then (yes)
  :process all\ndiagrams;
else (no)
  :process only
  __sequence__ and __activity__ diagrams;
endif

stop
```
</div>

<!-- slide vertical:true -->
## 功能 - 畫UML 2

* 畫 UML [語法看這](http://plantuml.com/)
<div class = "slide-2col-left">

Class Diagram

```plantuml

abstract class AbstractList
abstract AbstractCollection
interface List
interface Collection

List <|-- AbstractList
Collection <|-- AbstractCollection

Collection <|- List
AbstractCollection <|- AbstractList
AbstractList <|-- ArrayList

class ArrayList {
  Object[] elementData
  size()
}

enum TimeUnit {
  DAYS
  HOURS
  MINUTES
}

annotation SuppressWarnings


```
</div>
<div class = "slide-2col-right">
State Diagram

```plantuml

[*] -> State1
State1 --> State2 : Succeeded
State1 --> [*] : Aborted
State2 --> State3 : Succeeded
State2 --> [*] : Aborted
state State3 {
  state "Accumulate Enough Data\nLong State Name" as long1
  long1 : Just a test
  [*] --> long1
  long1 --> long1 : New Data
  long1 --> ProcessData : Enough Data
}
State3 --> State3 : Failed
State3 --> [*] : Succeeded / Save Result
State3 --> [*] : Aborted
```


<!-- slide  -->
## 寫 slide

<span class="fragment fade-in">這個 slide 就是用 markdown 寫的哦</span>
<span class="fragment">這個 slide 就是用 markdown 寫的哦</span>
<span class="fragment">這個 slide 就是用 markdown 寫的哦</span>
<span class="fragment">因為很好寫，所以要講 3 次</span>


<!-- slide  -->
## 寫 slide 的相關文件

[說明](https://shd101wyy.github.io/markdown-preview-enhanced/#/presentation?id=customize-slide-style)

[demo 1](https://rawgit.com/shd101wyy/markdown-preview-enhanced/master/docs/presentation-intro.html)

[reveal.js](https://github.com/hakimel/reveal.js/)

<span class="fragment"> reveal js 是一個寫 slide 的 套件</span>

<!-- slide -->
## 功能 - 數學算式

* 簡單的就能寫出唬人的算式  $ \int_1^\infty{\frac{1}{1 - e^{-1}}x^n dx} $

<span class="fragment fade-out">


$$ \sum^i_{i=100} $$

$$ \left(\sum^n_{i=0}i^2 = \frac{(n^2+n)(2n+1)}{6} \right) $$

</span>

<span class="fragment fade-out">
 $$  \Gamma(z) =  
  \int_0 ^ \infty t ^{z-1} e ^{-t} d t
 $$

<span class="fragment fade-out">

使用的是 [MathJax](https://www.mathjax.org/)
[MathJax语法详解](http://waterbolik.github.io/jekyll/2015/10/14/MathJax%E8%AF%AD%E6%B3%95%E8%AF%A6%E8%A7%A3)

<!-- slide -->

# 安裝說明

* [ATOM](https://atom.io)
* ATOM package - Markdown Preview Enahnced
* git client
  * or [SourceTree](https://www.sourcetreeapp.com/)
  * or ATOM package - Git Plus
* GraphVis

<!-- slide -->

# 安裝說明 - Plantuml

### 下載 [plantuml](http://plantuml.com/download)


### 安裝 GraphVis

```bash
brew install libtool
brew link libtool
brew install graphviz
brew link --overwrite graphviz
```

### Test

```
java -jar plantuml.jar -testdot
```
<!-- slide -->

# 如何將 寫好的文件放至 gitlab 上 ??

<!-- slide -->

## 找到 或 建立 專案
> 登入 -> New Project

<!-- slide -->

## 把 wiki clone 到 本機上
> 1. 點選 project -> Wiki -> Clone repository -> copy Path
> 2. 打開 terminal, 到你想去的目錄中
> 3. git clone [repository url]
> 4. $ cd [project.wiki]; atom .;

<!-- slide -->

## 編輯完了要放上 Server
> 1. git add * ; git commit -m "markdown 好好用"; git push

<!-- slide -->

# Q&A

