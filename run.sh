#!/bin/sh
git clone https://github.com/django/django.git
docker build --tag=django-tests .

docker run -d -p 5432:5432 --name django-test-db postgres:9.4
# delay for the database to get up
sleep 2
# create databases
docker run --rm -ti --link django-test-db:db --name django-tests-run django-tests psql -h db -U postgres -c 'CREATE DATABASE "default";'
docker run --rm -ti --link django-test-db:db --name django-tests-run django-tests psql -h db -U postgres -c 'CREATE DATABASE "other";'
docker run --rm -ti --link django-test-db:db --name django-tests-run django-tests
# cleanup
docker stop django-test-db
docker rm django-test-db
