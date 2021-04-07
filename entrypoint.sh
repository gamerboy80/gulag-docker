#!/bin/bash
service nginx start
if [ -e default.jpg ]
then
	mv default.jpg .data/avatars
fi
./main.py
