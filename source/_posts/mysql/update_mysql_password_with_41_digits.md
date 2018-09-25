---
title: Mysql 無法登入
categories: mysql
tags: [mysql,howto]
---

## 問題

Mysql 無法登入

一直遇到下面的問題

```
Fatal error: Uncaught PDOException: SQLSTATE[HY000] [2000] mysqlnd cannot connect to MySQL 4.1+ using the old insecure authentication. Please use an administration tool to reset your password with the command SET PASSWORD = PASSWORD('your_existing_password'). This will store a new, and more secure, hash value in mysql.user. If this user is used in other scripts executed by PHP 5.2 or earlier you might need to remove the old-passwords flag from your my.cnf file in /Users/riverlin/Documents/workspace/PChomePay/pchomepay/pcpay-core/app/Database/Mysql/MysqlConnectionPool.php:44
Stack trace:
```

進行了 網路上建議的 `set password = PASSWORD('password') ;`

還是無法解決

原來 session 的設定還是舊的，要再加上 `SET @@session.old_passwords = 0;` 才可以

## 完整指令

```sql
SET @@session.old_passwords = 0;
select PASSWORD('password') ;
```