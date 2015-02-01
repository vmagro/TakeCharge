#!/bin/bash

sudo dfu-programmer atmega16u2 erase
sudo dfu-programmer atmega16u2 flash Arduino-usbserial-uno.hex
