EESchema Schematic File Version 2
LIBS:Lysring-rescue
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Lysring-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328P-PU U2
U 1 1 5B99672F
P 4700 2800
F 0 "U2" H 3950 4050 50  0000 L BNN
F 1 "ATMEGA328P-PU" H 5100 1400 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm_LongPads" H 4700 2800 50  0001 C CIN
F 3 "" H 4700 2800 50  0001 C CNN
	1    4700 2800
	1    0    0    -1  
$EndComp
$Comp
L L7805 U1
U 1 1 5B9967C8
P 2350 1700
F 0 "U1" H 2200 1825 50  0000 C CNN
F 1 "L7805" H 2350 1825 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 2375 1550 50  0001 L CIN
F 3 "" H 2350 1650 50  0001 C CNN
	1    2350 1700
	1    0    0    -1  
$EndComp
$Comp
L Crystal_Small 16MHz
U 1 1 5B996803
P 6900 2500
F 0 "16MHz" H 6900 2600 50  0000 C CNN
F 1 "Crystal_Small" H 6900 2400 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 6900 2500 50  0001 C CNN
F 3 "" H 6900 2500 50  0001 C CNN
	1    6900 2500
	0    1    1    0   
$EndComp
$Comp
L C_Small 22p
U 1 1 5B9968AA
P 7150 2300
F 0 "22p" H 7160 2370 50  0000 L CNN
F 1 "C_Small" H 7160 2220 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7150 2300 50  0001 C CNN
F 3 "" H 7150 2300 50  0001 C CNN
	1    7150 2300
	0    1    1    0   
$EndComp
$Comp
L C_Small 22p
U 1 1 5B99692B
P 7150 2700
F 0 "22p" H 7160 2770 50  0000 L CNN
F 1 "C_Small" H 7160 2620 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7150 2700 50  0001 C CNN
F 3 "" H 7150 2700 50  0001 C CNN
	1    7150 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 2300 7050 2300
Wire Wire Line
	6900 2300 6900 2400
Wire Wire Line
	6600 2700 7050 2700
Wire Wire Line
	6900 2700 6900 2600
$Comp
L GND #PWR01
U 1 1 5B996985
P 7350 2300
F 0 "#PWR01" H 7350 2050 50  0001 C CNN
F 1 "GND" H 7350 2150 50  0000 C CNN
F 2 "" H 7350 2300 50  0001 C CNN
F 3 "" H 7350 2300 50  0001 C CNN
	1    7350 2300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 5B9969A6
P 7350 2700
F 0 "#PWR02" H 7350 2450 50  0001 C CNN
F 1 "GND" H 7350 2550 50  0000 C CNN
F 2 "" H 7350 2700 50  0001 C CNN
F 3 "" H 7350 2700 50  0001 C CNN
	1    7350 2700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 5B9969EA
P 3550 4000
F 0 "#PWR03" H 3550 3750 50  0001 C CNN
F 1 "GND" H 3550 3850 50  0000 C CNN
F 2 "" H 3550 4000 50  0001 C CNN
F 3 "" H 3550 4000 50  0001 C CNN
	1    3550 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5B996A3A
P 2350 2100
F 0 "#PWR04" H 2350 1850 50  0001 C CNN
F 1 "GND" H 2350 1950 50  0000 C CNN
F 2 "" H 2350 2100 50  0001 C CNN
F 3 "" H 2350 2100 50  0001 C CNN
	1    2350 2100
	1    0    0    -1  
$EndComp
$Comp
L Barrel_Jack J1
U 1 1 5B996A99
P 1200 1700
F 0 "J1" H 1200 1910 50  0000 C CNN
F 1 "Barrel_Jack" H 1200 1525 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 1250 1660 50  0001 C CNN
F 3 "" H 1250 1660 50  0001 C CNN
	1    1200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2000 2350 2100
Wire Wire Line
	2050 1700 1500 1700
Wire Wire Line
	1500 1800 1500 2050
Wire Wire Line
	1500 2050 2850 2050
Connection ~ 2350 2050
Wire Wire Line
	2650 1700 3800 1700
Wire Wire Line
	3350 2000 3800 2000
Wire Wire Line
	3350 1400 3350 2000
Connection ~ 3350 1700
Wire Wire Line
	3550 4000 3800 4000
Wire Wire Line
	3700 4000 3700 3900
Wire Wire Line
	3700 3900 3800 3900
Connection ~ 3700 4000
Connection ~ 6900 2300
Wire Wire Line
	5700 2400 6600 2400
Wire Wire Line
	6600 2400 6600 2700
Connection ~ 6900 2700
Wire Wire Line
	7250 2700 7350 2700
Wire Wire Line
	7350 2300 7250 2300
$Comp
L 7SEGMENT_CC-RESCUE-Lysring U3
U 1 1 5B996F14
P 6800 4900
F 0 "U3" H 6300 5275 50  0000 R CNN
F 1 "7SEGMENT_CC" H 6300 5200 50  0000 R CNN
F 2 "Housings_DIP:DIP-10_W7.62mm_Socket" H 6850 4600 50  0001 L CNN
F 3 "" H 6800 4920 50  0001 L CNN
	1    6800 4900
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J2
U 1 1 5B996FAE
P 6950 1700
F 0 "J2" H 6950 1900 50  0000 C CNN
F 1 "Conn_01x03" H 6950 1500 50  0000 C CNN
F 2 "Connectors:PINHEAD1-3" H 6950 1700 50  0001 C CNN
F 3 "" H 6950 1700 50  0001 C CNN
	1    6950 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5B997125
P 6500 1850
F 0 "#PWR05" H 6500 1600 50  0001 C CNN
F 1 "GND" H 6350 1800 50  0000 C CNN
F 2 "" H 6500 1850 50  0001 C CNN
F 3 "" H 6500 1850 50  0001 C CNN
	1    6500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1400 8850 1400
Wire Wire Line
	3350 1700 3400 1700
Connection ~ 3400 1700
Wire Wire Line
	6400 4100 6400 3700
Wire Wire Line
	6400 3700 5700 3700
Wire Wire Line
	6500 4100 6500 3800
Wire Wire Line
	6500 3800 5700 3800
Wire Wire Line
	6600 4100 6600 3900
Wire Wire Line
	6600 3900 5700 3900
Wire Wire Line
	6700 4100 6700 4000
Wire Wire Line
	6700 4000 5700 4000
Wire Wire Line
	6800 4100 6800 3300
Wire Wire Line
	6800 3300 6200 3300
Wire Wire Line
	6200 3300 6200 1800
Wire Wire Line
	6200 1800 5700 1800
Wire Wire Line
	6900 4100 6900 3200
Wire Wire Line
	6900 3200 6150 3200
Wire Wire Line
	6150 3200 6150 1900
Wire Wire Line
	6150 1900 5700 1900
Wire Wire Line
	7000 4100 7000 3100
Wire Wire Line
	7000 3100 6100 3100
Wire Wire Line
	6100 3100 6100 2000
Wire Wire Line
	5700 2000 9000 2000
$Comp
L GND #PWR06
U 1 1 5B9975E1
P 6800 5500
F 0 "#PWR06" H 6800 5250 50  0001 C CNN
F 1 "GND" H 6800 5350 50  0000 C CNN
F 2 "" H 6800 5500 50  0001 C CNN
F 3 "" H 6800 5500 50  0001 C CNN
	1    6800 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 5300 6800 5500
Wire Wire Line
	6900 5300 6900 5400
Wire Wire Line
	6900 5400 6800 5400
Connection ~ 6800 5400
$Comp
L R R1
U 1 1 5B9977D0
P 6400 4250
F 0 "R1" V 6350 4050 50  0000 C CNN
F 1 "470R" V 6400 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6330 4250 50  0001 C CNN
F 3 "" H 6400 4250 50  0001 C CNN
	1    6400 4250
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5B997880
P 6500 4250
F 0 "R2" V 6450 4050 50  0000 C CNN
F 1 "470R" V 6500 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6430 4250 50  0001 C CNN
F 3 "" H 6500 4250 50  0001 C CNN
	1    6500 4250
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5B9978BC
P 6600 4250
F 0 "R3" V 6550 4050 50  0000 C CNN
F 1 "470R" V 6600 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6530 4250 50  0001 C CNN
F 3 "" H 6600 4250 50  0001 C CNN
	1    6600 4250
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5B9978F5
P 6700 4250
F 0 "R4" V 6650 4050 50  0000 C CNN
F 1 "470R" V 6700 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6630 4250 50  0001 C CNN
F 3 "" H 6700 4250 50  0001 C CNN
	1    6700 4250
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5B99792F
P 6800 4250
F 0 "R5" V 6750 4050 50  0000 C CNN
F 1 "470R" V 6800 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6730 4250 50  0001 C CNN
F 3 "" H 6800 4250 50  0001 C CNN
	1    6800 4250
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5B99796E
P 6900 4250
F 0 "R6" V 6850 4050 50  0000 C CNN
F 1 "470R" V 6900 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6830 4250 50  0001 C CNN
F 3 "" H 6900 4250 50  0001 C CNN
	1    6900 4250
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5B9979B4
P 7000 4250
F 0 "R7" V 6950 4050 50  0000 C CNN
F 1 "470R" V 7000 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6930 4250 50  0001 C CNN
F 3 "" H 7000 4250 50  0001 C CNN
	1    7000 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4400 6400 4500
Wire Wire Line
	6500 4400 6500 4500
Wire Wire Line
	6600 4400 6600 4500
Wire Wire Line
	6700 4400 6700 4500
Wire Wire Line
	6800 4400 6800 4500
Wire Wire Line
	6900 4400 6900 4500
Wire Wire Line
	7000 4400 7000 4500
$Comp
L Rotary_Encoder_Switch SW1
U 1 1 5B997C54
P 7750 3500
F 0 "SW1" H 7750 3760 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 7750 3240 50  0000 C CNN
F 2 "Buttons_Switches_THT:KSA_Tactile_SPST" H 7650 3660 50  0001 C CNN
F 3 "" H 7750 3760 50  0001 C CNN
	1    7750 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5B997D2B
P 8350 3700
F 0 "#PWR07" H 8350 3450 50  0001 C CNN
F 1 "GND" H 8350 3550 50  0000 C CNN
F 2 "" H 8350 3700 50  0001 C CNN
F 3 "" H 8350 3700 50  0001 C CNN
	1    8350 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5B997D6D
P 7250 3700
F 0 "#PWR08" H 7250 3450 50  0001 C CNN
F 1 "GND" H 7250 3550 50  0000 C CNN
F 2 "" H 7250 3700 50  0001 C CNN
F 3 "" H 7250 3700 50  0001 C CNN
	1    7250 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3500 7250 3500
Wire Wire Line
	7250 3500 7250 3700
Wire Wire Line
	8050 3600 8350 3600
Wire Wire Line
	8350 3600 8350 3700
Wire Wire Line
	8050 3400 8050 2200
Wire Wire Line
	5700 2200 8250 2200
Wire Wire Line
	7450 3600 5700 3600
Wire Wire Line
	7450 3400 6000 3400
Wire Wire Line
	6000 3400 6000 3500
Wire Wire Line
	6000 3500 5700 3500
$Comp
L Conn_02x03_Odd_Even J3
U 1 1 5B9981B2
P 8550 2950
F 0 "J3" H 8600 3150 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 8600 2750 50  0000 C CNN
F 2 "Connectors_JST:B06-J11DK_2x03_Pitch2.54mm" H 8550 2950 50  0001 C CNN
F 3 "" H 8550 2950 50  0001 C CNN
	1    8550 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5B998207
P 9100 3100
F 0 "#PWR09" H 9100 2850 50  0001 C CNN
F 1 "GND" H 9100 2950 50  0000 C CNN
F 2 "" H 9100 3100 50  0001 C CNN
F 3 "" H 9100 3100 50  0001 C CNN
	1    9100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3050 9100 3050
Wire Wire Line
	9100 3050 9100 3100
Wire Wire Line
	8850 2950 9000 2950
Wire Wire Line
	9000 2950 9000 2000
Connection ~ 6100 2000
Wire Wire Line
	8850 1400 8850 2850
Connection ~ 6300 1400
Wire Wire Line
	8350 3050 5950 3050
Wire Wire Line
	5950 3050 5950 3150
Wire Wire Line
	5950 3150 5700 3150
$Comp
L R R8
U 1 1 5B9983C3
P 8150 2900
F 0 "R8" V 8230 2900 50  0000 C CNN
F 1 "10K" V 8150 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8080 2900 50  0001 C CNN
F 3 "" H 8150 2900 50  0001 C CNN
	1    8150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2750 8150 2550
Wire Wire Line
	8150 2550 8850 2550
Connection ~ 8850 2550
Wire Wire Line
	8150 3050 8200 3050
Connection ~ 8200 3050
Connection ~ 8150 3050
Wire Wire Line
	8350 2850 8350 2100
Wire Wire Line
	8350 2100 5700 2100
Wire Wire Line
	8350 2950 8250 2950
Wire Wire Line
	8250 2950 8250 2200
Connection ~ 8050 2200
$Comp
L CP C3
U 1 1 5B99958D
P 1850 1850
F 0 "C3" H 1875 1950 50  0000 L CNN
F 1 "100u" H 1875 1750 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P2.50mm" H 1888 1700 50  0001 C CNN
F 3 "" H 1850 1850 50  0001 C CNN
	1    1850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1700 1850 1700
Connection ~ 1850 1700
Connection ~ 1900 1700
Wire Wire Line
	1850 2000 1850 2050
Connection ~ 1850 2050
$Comp
L C C4
U 1 1 5B9996EE
P 2850 1900
F 0 "C4" H 2875 2000 50  0000 L CNN
F 1 "100n" H 2875 1800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2888 1750 50  0001 C CNN
F 3 "" H 2850 1900 50  0001 C CNN
	1    2850 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1700 2850 1750
Connection ~ 2850 1700
Text Label 3050 1700 0    60   ~ 0
VCC
Wire Wire Line
	6750 1800 6500 1800
Wire Wire Line
	6500 1800 6500 1850
Wire Wire Line
	6750 1700 6300 1700
Wire Wire Line
	6300 1700 6300 1400
Wire Wire Line
	6750 1600 6200 1600
Wire Wire Line
	6200 1600 6200 1700
Wire Wire Line
	6200 1700 5700 1700
$EndSCHEMATC
