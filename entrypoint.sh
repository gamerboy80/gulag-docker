#!/bin/bash
service nginx start
mv default.jpg .data/avatars
./main.py
