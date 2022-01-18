#!/bin/sh
sqlite3 /etc/postfix/virtualdb/mailserver.db < /init.sql
postfix start-fg
