#!/usr/bin/env bash

TMP="$(mktemp)"

$CHUCK --probe &> $TMP
grep -B1 "$1" $TMP | head -1 | grep -o "[0-9]"
rm $TMP
