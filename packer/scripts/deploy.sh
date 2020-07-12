#!/bin/bash

set -e

cd /home/appuser

git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install

mv /tmp/puma.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable puma.service
systemctl start puma.service
