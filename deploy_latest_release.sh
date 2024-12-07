#!/bin/bash
git fetch --tags
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $latest_tag
docker build -t python-web-app:$latest_tag .
docker run -d -p 5000:5000 python-web-app:$latest_tag
