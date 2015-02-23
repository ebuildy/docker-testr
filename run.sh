#!/bin/bash

supervisord -c /etc/supervisor/supervisord.conf &

sleep 5

echo "Running tests..."

casperjs test /var/tests.js
