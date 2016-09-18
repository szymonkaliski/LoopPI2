#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pushd $DIR

./wolfson-record-linein.sh
./wolfson-output-lineout.sh

DAC=$(./find-device.sh "snd_rpi_wsp")
ADC=$(./find-device.sh "snd_rpi_wsp")
MIDI=$(./find-device.sh "nanoKONTROL2")

$CHUCK --dac:$DAC --adc:$ADC --in:1 --out:2 looper.ck
