# Arduino-Macro-Ring

This project is for a RGB LED ring that can be used for macro photography or microscopes. 
It uses a WS2812B Module Strip from [Aliexpress](https://www.aliexpress.com/item/WS2812B-Module-Strip-24-Bits-24-X-WS2812-5050-RGB-LED-Ring-Lamp-Light-with-Integrated/32842513885.html?spm=a2g0s.9042311.0.0.27424c4dtHlEIW)

The ring can be configured by a rotary switch controlled from a Arduino Nano microcontroller. the following modes can be selected:
- White light with dimming function
- RED light with dimming
- BLUE light with dimming
- GREEN light with dimming
- Random colour with dimming
- Select how many LED's that will be ON, from zero to all
- Rotate the selected LED's around the circle

By selecting between the different modes, it is possible to get different colours dimmed and the object at the centre lit from different angles. The mode selection is shown on a 7-segment display.

## Hardware

The project contains 3D model for an small enclosure for the electronics, and an arm intended for mounting on a microscope.

## Software

The sotware is written in C and relies on the HCWS2812 library written by Andrew Davies.

## Cirquit diagram

<img align="center" width="700" src="Cirquit_diagram.png">

## Licence

2019 MIT
