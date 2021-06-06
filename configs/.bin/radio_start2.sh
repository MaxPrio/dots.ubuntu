#!/bin/bash
killall mpg123
sleep 1
wget -O - $1 | mpg123 -

