#!/bin/bash

docker run --rm -p 10389:10389 -v `pwd`/bootstrap:/bootstrap -e BOOTSTRAP_FILE=/bootstrap/users.ldif docker.local:5000/greggigon-apacheds
