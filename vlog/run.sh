#!/bin/sh
VLOG=../../vlog/vlog

rm -rf indexDir materialization_ccomp

# load the database in the ttl directory, creating the index in "indexDir".

$VLOG load -i facts -o indexDir


$VLOG mat -e edb.conf --storemat_path materialization_ccomp --storemat_format files --decompressmat true --rules rule.dlog

$VLOG query -e edb.conf  -q query.sql

$VLOG query -e edb.conf  -q query2.sql

