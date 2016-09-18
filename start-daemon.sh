#!/usr/bin/env bash

tmux -u new-session -d -s "looppi"
tmux send-keys "bash ~/looppi/start.sh" "C-m"
