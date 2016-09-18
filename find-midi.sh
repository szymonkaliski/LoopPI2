#!/usr/bin/env bash

TMP="$(mktemp)"

$CHUCK --probe &> $TMP
grep "$1" $TMP | head -1 | grep -o "[0-9]" | head -1
rm $TMP
