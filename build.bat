@echo off

docker build -t dr4g0nsr/apache2 .
docker create dr4g0nsr/apache2
