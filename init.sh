#!/bin/sh
service ssh $1
service docker $1
service redis-server $1
service mysql $1
service nginx $1
