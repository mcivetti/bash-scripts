#!/usr/bin/env bash

# Create new directory under /tmp/ for host, zip files under host dir and export copy of database using wp cli. 

# Create host using argument to script
HOST=$1

# Make backup dir under /tmp/
mkdir /tmp/${HOST} && cd /tmp/$1;

# Zip files only proceed if dir exists
      if [[ -d /tmp/${HOST} ]]; then
        tar -czvf ${HOST}.tar.gz /var/www/${HOST}/;
      fi
# If it's a WP site; export db
      if $(wp core is-installed --path=/var/www/${HOST}/htdocs/); then
         wp db export --path=/var/www/${HOST}/htdocs/;
      fi
