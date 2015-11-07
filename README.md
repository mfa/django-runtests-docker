# Docker based running Django runtests with Postgresql

## run tests

```
sh run.sh
```

## possible improvements

- use docker-compose
- use mysql docker container too


## digitalocean test box walkthrough

- install debian 8.2 64bit
- install https transport for apt: ``apt-get update && apt-get install apt-transport-https``
- install Docker: https://docs.docker.com/engine/installation/debian/#debian-jessie-80-64-bit
- clone this repo: ``git clone https://github.com/mfa/django-runtests-docker.git``
- ``sh run.sh``
