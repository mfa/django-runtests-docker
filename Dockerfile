FROM python:3.6-stretch

USER root

RUN mkdir -p /opt/code

ENV PYTHONPATH /opt/code:$PYTHONPATH
ENV DJANGO_SETTINGS_MODULE tests.test_postgres_docker

RUN apt-get update && apt-get install -y \
	gcc \
	libmemcached-dev \
	libpq-dev \
	postgresql-client \
	sqlite3 \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

ADD https://raw.githubusercontent.com/django/django/master/tests/requirements/postgres.txt /opt/requirements-postgres.txt
RUN pip install -Ur /opt/requirements-postgres.txt

ADD https://raw.githubusercontent.com/django/django/master/tests/requirements/py3.txt /opt/requirements-py3.txt
RUN pip install -Ur /opt/requirements-py3.txt

WORKDIR /opt

COPY test_postgres_docker.py /opt
COPY runtests.py /opt

CMD /opt/runtests.py
