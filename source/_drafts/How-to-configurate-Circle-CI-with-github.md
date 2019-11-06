---
title: How to setup Circle CI in new Project with cli
tags: [CI,cicle-ci,github,howto,clcieci-cli,cli]
---
## Prerequirement
You have to have a cicleci account linked with github

## Steps

### Install circleci

In OSX

```bash
$ brew install circleci
```

Circle-CI setup

Create api token from [here](https://circleci.com/account/api)

```bash
# settup circle api token
➜  blog-src git:(master) ✗ circleci setup
✔ CircleCI API Token: ****************************************
API token has been set.
✔ CircleCI Host: https://circleci.com
CircleCI host has been set.
Setup complete.
Your configuration has been saved to !/.circleci/cli.yml.

Trying an introspection query on API to verify your setup... Ok.
Trying to query our API for your profile name... Hello!%
```

Setting up circle ci config file
```bash
$ cd ${PRJ_FOLDER}; mkdir .circleci; cd .circleci; touch config.yml

```

Get sample file from [here](https://circleci.com/docs/2.0/example-configs/)

```yaml
version: 2
jobs:
  build:
    docker:
      - image: circleci/<language>:<version TAG>
    steps:
      - checkout
      - run: <command> 
  test:
    docker:
      - image: circleci/<language>:<version TAG>
    steps:
      - checkout
      - run: <command>
workflows:
  version: 2
  build_and_test:
    jobs:
      - build
      - test
```

Validate config in local, and execute it in local

```bash
$ circleci config validate
$ circleci local execute
```

At last, add everything and push them to github.

Go [Circle Ci](https://circleci.com/dashboard) for result.