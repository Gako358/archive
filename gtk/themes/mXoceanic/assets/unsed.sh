#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1b2b34/g' \
         -e 's/rgb(100%,100%,100%)/#ffffff/g' \
    -e 's/rgb(50%,0%,0%)/#343d46/g' \
     -e 's/rgb(0%,50%,0%)/#6699cc/g' \
 -e 's/rgb(0%,50.196078%,0%)/#6699cc/g' \
     -e 's/rgb(50%,0%,50%)/#c0c5ce/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#c0c5ce/g' \
     -e 's/rgb(0%,0%,50%)/#1b2b34/g' \
	"$@"
