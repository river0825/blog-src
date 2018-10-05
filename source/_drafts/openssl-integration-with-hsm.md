---
title: openssl integration with hsm
categories: openssl
tags: [openssl,hsm,crypto]
---

在某些安全要求較高的環境中，會需要使用 HSM 來作為加解密 Key 設備

- 操作環境

- Ubuntu

- [SoftHSM](https://www.opendnssec.org/softhsm/)

- openssl

- [libp11](https://github.com/OpenSC/libp11)
    > 作為 openssl 與 hsm 溝通的介面，尊循 pkcs#11 的標準

## 安裝所需元件

`SoftHsm`
- 直接以 docker 的方式取得 SoftHSM

`libp11`
- 



## 設定 openssl pkcs11 engine



## 測試

## 用法

### 產 key

### sign 

### verify

### 加密

### 解密
