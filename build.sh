#!/bin/bash

chmod 777 apache-run
docker images -q --filter dangling=true | xargs docker rmi
docker build -t dr4g0nsr/apache2 .
