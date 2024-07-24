#!/bin/bash
service cron start
/usr/bin/su - pirate -c "/usr/local/bin/piratecashd"
