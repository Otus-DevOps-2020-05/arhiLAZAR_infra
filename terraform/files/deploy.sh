#!/bin/bash

set -e

cd /home/appuser

git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install

sudo mv /tmp/puma.service /lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable puma.service
sudo systemctl start puma.service
