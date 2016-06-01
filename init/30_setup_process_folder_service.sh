#!/bin/bash
rm -f /tmp/autounrar.pid

echo "Setting file permissions"
chmod -v +x /scripts/autounrar

echo "Adding cron job"
crontab -l | { cat; echo "*/5 * * * * /scripts/autounrar"; } | crontab -
