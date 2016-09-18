#!/usr/bin/env bash

rsync -azP --exclude ".git" --delete-after . pi@raspberrypi.local:~/looppi/
