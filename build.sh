#!/bin/bash

chmod 777 httpd-foreground
docker images -q --filter dangling=true | xargs docker rmi
docker build -t dr4g0nsr/apache2 .
docker create dr4g0nsr/apache2
