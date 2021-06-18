#!/bin/bash
docker login
docker build -f Dockerfile -t `whoami`/jupyter-keras .
docker push `whoami`/jupyter-keras