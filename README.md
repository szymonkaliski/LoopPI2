# LoopPI 2

![](/assets/photo.jpg)

New version of [LoopPI](https://github.com/szymonkaliski/LoopPI) project, running on Raspberry PI 3, with Woflson Audio card and Korg nanoKontrol2.

Previous version had numerous problems with sounds quality, was hard to replicate, and suffered from low processing power of original Raspberry PI. All the issues are fixed here :)

# Installation

1. Get the hardware needed, flash SD card with recent Raspbian (I'm using the Lite version), and SSH inside.
2. Update the distro and packages.
3. Install deps for chuck (we'll build it from source): `sudo apt-get install libsndfile1-dev libasound2-dev`
4. Download ChucK source into `~/binaries` (or wherever), extract and run: `make linux-alsa` which should build ChucK with ALSA as a backend.
5. Download `cirrus-linux-4.4.14.tgz` from [http://www.horus.com/~hias/cirrus-driver.html](http://www.horus.com/~hias/cirrus-driver.html).
6. Edit `/boot/config.txt` and add:

```
dtoverlay=rpi-cirrus-wm5102
dtoverlay=i2s-mmap
```

7. Create `/etc/modprobe.d/cirrus.conf`:

```
softdep arizona-spi pre: arizona-ldo1
softdep spi-bcm2708 pre: fixed
softdep spi-bcm2835 pre: fixed
```

8. Unpack cirrus kernel: `sudo tar zxf cirrus-linux-4.4.6.tgz -C /`
9. Reboot. `aplay -l` and `arecord -l` should now list Wolfson audio card!
10. Play! Clone this project, go into the dir, and run `CHUCK=/place/where/you/installed/chuck/binary ./start.sh`

## Autostart

I use `tmux` to "daemonize" the code, and autostart with `cron`:

```
$ crontab -l
@reboot CHUCK=/home/pi/binaries/chuck-1.3.5.2/src/chuck ~/looppi/start-daemon.sh
```

# References

- [Wolfson on RPI3](https://www.element14.com/community/message/196122/l/re-cirrus-logic-audio-card-and-raspberry-pi-3#196122)
- [Chuck from source](https://medium.com/code-zen/running-chuck-on-rpi-4acaf51a0218#.2zn4j3hbe)
