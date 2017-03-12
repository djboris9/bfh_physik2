EESchema Schematic File Version 2
LIBS:power
LIBS:device
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
LIBS:soundtracker-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Soundtracker"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R1
U 1 1 58C2D262
P 1800 1600
F 0 "R1" V 1880 1600 50  0000 C CNN
F 1 "10k" V 1800 1600 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0309_L9.0mm_D3.2mm_P5.08mm_Vertical" V 1730 1600 50  0001 C CNN
F 3 "" H 1800 1600 50  0000 C CNN
	1    1800 1600
	1    0    0    -1  
$EndComp
$Comp
L LM386 U1
U 1 1 58C2D30E
P 2950 2050
F 0 "U1" H 3000 2350 50  0000 L CNN
F 1 "LM386" H 3000 2250 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 3050 2150 50  0001 C CNN
F 3 "" H 3150 2250 50  0000 C CNN
	1    2950 2050
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 58C2D359
P 2200 1950
F 0 "C2" H 2225 2050 50  0000 L CNN
F 1 "47nF" H 2225 1850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 2238 1800 50  0001 C CNN
F 3 "" H 2200 1950 50  0000 C CNN
	1    2200 1950
	0    -1   -1   0   
$EndComp
$Comp
L CP C3
U 1 1 58C2D382
P 3200 2550
F 0 "C3" H 3225 2650 50  0000 L CNN
F 1 "10uF" H 3225 2450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D4.0mm_P1.50mm" H 3238 2400 50  0001 C CNN
F 3 "" H 3200 2550 50  0000 C CNN
	1    3200 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 2750 2650 2150
Wire Wire Line
	2850 2750 2850 2350
NoConn ~ 2950 1750
Wire Wire Line
	2950 2350 2950 2550
Wire Wire Line
	2650 1950 2350 1950
$Comp
L CP C4
U 1 1 58C2E8FB
P 4050 2050
F 0 "C4" H 4075 2150 50  0000 L CNN
F 1 "22uF" H 4075 1950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D4.0mm_P1.50mm" H 4088 1900 50  0001 C CNN
F 3 "" H 4050 2050 50  0000 C CNN
	1    4050 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 2050 3900 2050
Wire Wire Line
	3350 2350 3350 2550
Wire Wire Line
	2950 2550 3050 2550
$Comp
L Microphone MCE-101
U 1 1 58C2D165
P 1800 2350
F 0 "MCE-101" H 1650 2400 50  0000 R CNN
F 1 "Microphone" H 1650 2325 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.00mm" V 1800 2450 50  0001 C CNN
F 3 "" V 1800 2450 50  0000 C CNN
	1    1800 2350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P1
U 1 1 58C30220
P 5500 2050
F 0 "P1" H 5500 2250 50  0000 C CNN
F 1 "CONN_01X03" V 5600 2050 50  0000 C CNN
F 2 "" H 5500 2050 50  0001 C CNN
F 3 "" H 5500 2050 50  0000 C CNN
	1    5500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2750 1050 2750
Connection ~ 2850 1250
Connection ~ 2650 2750
Connection ~ 2850 2750
Wire Wire Line
	5000 2150 5000 2750
Wire Wire Line
	5000 1250 5000 1950
Wire Wire Line
	3050 2350 3350 2350
Wire Wire Line
	2850 1250 2850 1750
Wire Wire Line
	1800 1250 1800 1450
Wire Wire Line
	1800 1750 1800 2150
Wire Wire Line
	1800 2750 1800 2550
Wire Wire Line
	2050 1950 1800 1950
Connection ~ 1800 1950
$Comp
L C C5
U 1 1 58C353D5
P 4050 2400
F 0 "C5" H 4075 2500 50  0000 L CNN
F 1 "47nF" H 4075 2300 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 4088 2250 50  0001 C CNN
F 3 "" H 4050 2400 50  0000 C CNN
	1    4050 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 2050 3550 2400
Connection ~ 3550 2050
$Comp
L R R2
U 1 1 58C355F1
P 4700 2400
F 0 "R2" V 4780 2400 50  0000 C CNN
F 1 "10" V 4700 2400 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0309_L9.0mm_D3.2mm_P5.08mm_Vertical" V 4630 2400 50  0001 C CNN
F 3 "" H 4700 2400 50  0000 C CNN
	1    4700 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 2400 3900 2400
Wire Wire Line
	4200 2400 4550 2400
Wire Wire Line
	5000 2400 4850 2400
Connection ~ 5000 2400
$Comp
L GND #PWR01
U 1 1 58C36997
P 5000 2750
F 0 "#PWR01" H 5000 2500 50  0001 C CNN
F 1 "GND" H 5000 2600 50  0000 C CNN
F 2 "" H 5000 2750 50  0000 C CNN
F 3 "" H 5000 2750 50  0000 C CNN
	1    5000 2750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 58C369BF
P 5000 1250
F 0 "#PWR02" H 5000 1100 50  0001 C CNN
F 1 "+5V" H 5000 1390 50  0000 C CNN
F 2 "" H 5000 1250 50  0000 C CNN
F 3 "" H 5000 1250 50  0000 C CNN
	1    5000 1250
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 58C36FA6
P 1050 2000
F 0 "C1" H 1075 2100 50  0000 L CNN
F 1 "47uF" H 1075 1900 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D4.0mm_P1.50mm" H 1088 1850 50  0001 C CNN
F 3 "" H 1050 2000 50  0000 C CNN
	1    1050 2000
	1    0    0    -1  
$EndComp
Connection ~ 5000 1250
Wire Wire Line
	1050 1250 5000 1250
Wire Wire Line
	1050 1250 1050 1850
Connection ~ 1800 1250
Wire Wire Line
	1050 2750 1050 2150
Connection ~ 1800 2750
Wire Wire Line
	5000 1950 5300 1950
Wire Wire Line
	5000 2150 5300 2150
Wire Wire Line
	5300 2050 4200 2050
$EndSCHEMATC
