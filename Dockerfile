FROM python:3.4

USER root
RUN apt-get update && apt-get install -y \
		postgresql-client libpq-dev \
		sqlite3 \
		gcc \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

ADD django /opt/code
WORKDIR /opt/code/tests
ENV PYTHONPATH ..:$PYTHONPATH

COPY test_postgres_docker.py /opt/code/tests/
ENV DJANGO_SETTINGS_MODULE tests.test_postgres_docker

RUN pip install --trusted-host=pypi.qax.io --find-links=http://pypi.qax.io/wheels/ -r /opt/code/tests/requirements/py3.txt
RUN pip install --trusted-host=pypi.qax.io --find-links=http://pypi.qax.io/wheels/ -r /opt/code/tests/requirements/postgres.txt

CMD python3 ./runtests.py
