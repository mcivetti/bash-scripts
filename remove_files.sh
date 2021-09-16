#!/usr/bin/env bash

cd /var/www/$1/htdocs/

find . -type f -name "*.php.bak" -exec rm {} \;
find . -type d -name "*.bak" -exec rm -r {} \;
