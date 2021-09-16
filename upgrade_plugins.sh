#!/usr/bin/env bash

# Create list of hosts
HOST_LIST=($(find /var/www/*/ -maxdepth 1 -type d -name "htdocs"))

# Run Upgrades
for SITE in ${HOST_LIST[@]};
do
  if $(wp core is-installed --path=$SITE); then
        echo "Updating plugins under" $SITE
        wp plugin update --all --path=$SITE;
  fi
done
