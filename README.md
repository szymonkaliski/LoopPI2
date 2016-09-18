# LoopPI 2

RPI3 + Wolfson Audio + Chuck compiled from source

## Autostart

```
$ crontab -l
@reboot CHUCK=/home/pi/binaries/chuck-1.3.5.2/src/chuck ~/looppi/start-daemon.sh
```

## Links

- [Wolfson on RPI3](https://www.element14.com/community/message/196122/l/re-cirrus-logic-audio-card-and-raspberry-pi-3#196122)
- [Chuck from source](https://medium.com/code-zen/running-chuck-on-rpi-4acaf51a0218#.2zn4j3hbe) - compile with ALSA backend!
