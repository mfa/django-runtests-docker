#!/bin/sh
docker build --tag=django-tests .
git clone https://github.com/django/django.git

docker run --rm -d --name django-test-db postgres:10-alpine

# delay for the database to get up
sleep 5

# create databases
docker exec django-test-db psql -h localhost -U postgres -c 'CREATE DATABASE "default";'
docker exec django-test-db psql -h localhost -U postgres -c 'CREATE DATABASE "other";'
docker run --rm -it --link django-test-db:db -v "$(pwd)/django":/opt/code --name django-tests-run django-tests

# cleanup
docker stop django-test-db
