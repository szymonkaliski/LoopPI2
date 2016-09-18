#!/bin/bash

# $1 added to support 1st line argument. i.e. "./Playback_to_Lineout.sh -q" will stop all the control information being displayed on screen

#Playback from AP to Line Output, default gain 0dB

# Clear the HPOUT2 Input 1 and 2  mixers. This will ensure no previous paths are connected to the HPOUT2.
# This doesn't include Inputs 3 and 4.
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2L Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2R Input 1' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2L Input 2' None
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2R Input 2' None
# Setup HPOUT2 input path and volume
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2L Input 1' AIF1RX1
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2L Input 1 Volume' 32
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2R Input 1' AIF1RX2
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2R Input 1 Volume' 32
# Unmute HPOUT2 Output
amixer $1 -Dhw:sndrpiwsp cset name='HPOUT2 Digital Switch' on


# The following command can be used to test
# aplay -Dhw:sndrpiwsp -r 44100 -c 2 -f S32_LE <file>



