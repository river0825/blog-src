---
title: how to config hexo with circle ci
tags:
---
ssh key gen

## how to set and test ssh key
https://circleci.com/docs/2.0/ssh-access-jobs/

ssh -i ~/.ssh/id_rsa_circle_ci

## in circle-ci ssh 
Host !github.com *
IdentityFile /home/circleci/.ssh/id_rsa_35e827963ba5610dcef3940e6ca6a056
IdentitiesOnly yes
User git

add a 