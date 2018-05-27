#!/bin/sh

cp /opt/test_postgres_docker.py /opt/code/tests/

pip3 install -Ur /opt/code/tests/requirements/py3.txt
pip3 install -Ur /opt/code/tests/requirements/postgres.txt

cd /opt/code/tests
python3 /opt/code/tests/runtests.py
