EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector:Screw_Terminal_01x08 J1
U 1 1 5F798267
P 850 2650
F 0 "J1" H 850 3100 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 930 2551 50  0001 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-8-2.54_1x08_P2.54mm_Horizontal" H 850 2650 50  0001 C CNN
F 3 "~" H 850 2650 50  0001 C CNN
	1    850  2650
	-1   0    0    -1  
$EndComp
$Comp
L dk_PMIC-Voltage-Regulators-Linear:LD1117S33CTR U1
U 1 1 5F79A530
P 2250 1850
F 0 "U1" H 2300 2137 60  0000 C CNN
F 1 "LM1117IMP-50" H 2300 2031 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 2450 2050 60  0001 L CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 2450 2150 60  0001 L CNN
F 4 "497-1241-1-ND" H 2450 2250 60  0001 L CNN "Digi-Key_PN"
F 5 "LD1117S33CTR" H 2450 2350 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2450 2450 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 2450 2550 60  0001 L CNN "Family"
F 8 "http://www.st.com/content/ccc/resource/technical/document/datasheet/99/3b/7d/91/91/51/4b/be/CD00000544.pdf/files/CD00000544.pdf/jcr:content/translations/en.CD00000544.pdf" H 2450 2650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/stmicroelectronics/LD1117S33CTR/497-1241-1-ND/586241" H 2450 2750 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 800MA SOT223" H 2450 2850 60  0001 L CNN "Description"
F 11 "STMicroelectronics" H 2450 2950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2450 3050 60  0001 L CNN "Status"
	1    2250 1850
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D1
U 1 1 5F79B447
P 4350 3050
F 0 "D1" H 4450 3450 50  0000 L CNN
F 1 "SK6812" H 4450 3350 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 4400 2750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 4450 2675 50  0001 L TNN
	1    4350 3050
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:SN75176AD U2
U 1 1 5F79CF78
P 3200 2850
F 0 "U2" H 3050 3350 50  0000 L CNN
F 1 "SN65176BDR" H 2650 3250 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3200 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn75176a.pdf" H 4800 2650 50  0001 C CNN
	1    3200 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1050 2350 1150 2350
Wire Wire Line
	1150 2350 1150 2550
Wire Wire Line
	1150 2550 1050 2550
Wire Wire Line
	1050 2750 1150 2750
Wire Wire Line
	1150 2550 1150 2750
Connection ~ 1150 2550
Wire Wire Line
	1050 2450 1250 2450
Wire Wire Line
	1250 2450 1250 2650
Wire Wire Line
	1250 2650 1050 2650
Wire Wire Line
	1050 2850 1250 2850
Wire Wire Line
	1250 2850 1250 2650
Connection ~ 1250 2650
Wire Wire Line
	3500 2650 3600 2650
Wire Wire Line
	3600 2650 3600 2750
Wire Wire Line
	3600 2750 3500 2750
Wire Wire Line
	3500 2950 3600 2950
Wire Wire Line
	3600 2950 3600 2750
Connection ~ 3600 2750
Connection ~ 3600 2950
$Comp
L Device:R R1
U 1 1 5F7A5A3F
P 2650 2850
F 0 "R1" V 2443 2850 50  0000 C CNN
F 1 "120" V 2534 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2580 2850 50  0001 C CNN
F 3 "~" H 2650 2850 50  0001 C CNN
	1    2650 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 2850 2800 3050
Connection ~ 2800 3050
Wire Wire Line
	2800 3050 2900 3050
Wire Wire Line
	2500 2850 2500 2950
Connection ~ 2500 2950
Wire Wire Line
	2500 2950 2900 2950
$Comp
L Device:CP C1
U 1 1 5F7AA1BC
P 1750 2000
F 0 "C1" H 1868 2046 50  0000 L CNN
F 1 "100" H 1868 1955 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-31_Kemet-D_Pad2.25x2.55mm_HandSolder" H 1788 1850 50  0001 C CNN
F 3 "~" H 1750 2000 50  0001 C CNN
	1    1750 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5F7AB014
P 2850 2000
F 0 "C2" H 2968 2046 50  0000 L CNN
F 1 "10" H 2968 1955 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 2888 1850 50  0001 C CNN
F 3 "~" H 2850 2000 50  0001 C CNN
	1    2850 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1850 2850 1850
Wire Wire Line
	1150 2350 1150 1850
Wire Wire Line
	1150 1850 1750 1850
Connection ~ 1150 2350
Connection ~ 1750 1850
Wire Wire Line
	1750 2150 1250 2150
Wire Wire Line
	1250 2150 1250 2450
Connection ~ 1750 2150
Connection ~ 1250 2450
Wire Wire Line
	1050 2950 2500 2950
Wire Wire Line
	1050 3050 2800 3050
Wire Wire Line
	2850 1850 3200 1850
Wire Wire Line
	3200 1850 3200 2450
Connection ~ 2850 1850
$Comp
L LED:SK6812 D2
U 1 1 5F7B9E6C
P 5250 3050
F 0 "D2" H 5350 3450 50  0000 L CNN
F 1 "SK6812" H 5350 3350 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 5300 2750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 5350 2675 50  0001 L TNN
	1    5250 3050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D4
U 1 1 5F7BAFC9
P 7100 3050
F 0 "D4" H 7200 3450 50  0000 L CNN
F 1 "SK6812" H 7200 3350 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 7150 2750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 7200 2675 50  0001 L TNN
	1    7100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3050 4050 3050
Wire Wire Line
	4650 3050 4950 3050
Wire Wire Line
	6450 3050 6800 3050
Wire Wire Line
	3200 1850 4350 1850
Wire Wire Line
	7100 1850 7100 2750
Connection ~ 3200 1850
Wire Wire Line
	5250 2750 5250 1850
Wire Wire Line
	4350 2750 4350 1850
Connection ~ 4350 1850
Wire Wire Line
	4350 1850 5250 1850
Wire Wire Line
	7100 3350 7100 3450
Wire Wire Line
	5250 3450 5250 3350
Wire Wire Line
	4350 3350 4350 3450
Wire Wire Line
	4350 3450 5250 3450
Wire Wire Line
	4350 3450 3600 3450
Wire Wire Line
	3600 2950 3600 3450
Connection ~ 4350 3450
Wire Wire Line
	3600 3450 3200 3450
Connection ~ 3600 3450
Wire Wire Line
	3200 3250 3200 3450
Wire Wire Line
	1250 2850 1250 3450
Wire Wire Line
	1250 3450 3200 3450
Connection ~ 1250 2850
Connection ~ 3200 3450
$Comp
L Connector:Screw_Terminal_01x08 J2
U 1 1 5F7C96A9
P 10950 2650
F 0 "J2" H 10900 3100 50  0000 L CNN
F 1 "Screw_Terminal_01x08" H 11030 2551 50  0001 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-8-2.54_1x08_P2.54mm_Horizontal" H 10950 2650 50  0001 C CNN
F 3 "~" H 10950 2650 50  0001 C CNN
	1    10950 2650
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:SN75176AD U3
U 1 1 5F7D5E56
P 9350 2850
F 0 "U3" H 9500 3350 50  0000 C CNN
F 1 "SN65176BDR" H 9450 3250 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9350 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn75176a.pdf" H 10950 2650 50  0001 C CNN
	1    9350 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 2750 10650 2750
Wire Wire Line
	10650 2750 10650 2550
Wire Wire Line
	10650 2550 10750 2550
Wire Wire Line
	10750 2350 10650 2350
Wire Wire Line
	10650 2350 10650 2550
Connection ~ 10650 2550
Wire Wire Line
	10650 2350 10650 2200
Connection ~ 10650 2350
Wire Wire Line
	8050 3450 8950 3450
Wire Wire Line
	9350 3450 9350 3250
Wire Wire Line
	10750 2450 10550 2450
Wire Wire Line
	10550 2450 10550 2650
Wire Wire Line
	10550 2650 10750 2650
Wire Wire Line
	10750 2850 10550 2850
Wire Wire Line
	10550 2850 10550 2650
Connection ~ 10550 2650
Wire Wire Line
	10550 3450 10550 2850
Connection ~ 10550 2850
Wire Wire Line
	9650 2950 9700 2950
Wire Wire Line
	9650 3050 10000 3050
Wire Wire Line
	8050 1850 8950 1850
Wire Wire Line
	9350 1850 9350 2450
Wire Wire Line
	8350 3050 8800 3050
Wire Wire Line
	8800 3050 8800 2750
Wire Wire Line
	8800 2750 9050 2750
Wire Wire Line
	9050 2650 8950 2650
Wire Wire Line
	8950 2950 9050 2950
Wire Wire Line
	8950 2650 8950 2950
Wire Wire Line
	8950 2650 8950 1850
Connection ~ 8950 2650
Connection ~ 8950 1850
Wire Wire Line
	8950 1850 9350 1850
Wire Wire Line
	1750 2150 2250 2150
Connection ~ 2250 2150
Wire Wire Line
	2250 2150 2850 2150
Text GLabel 1750 1750 1    50   Input ~ 0
12V
Wire Wire Line
	1750 1750 1750 1850
Text GLabel 10650 2200 1    50   Input ~ 0
12V
Wire Wire Line
	9050 3050 8950 3050
Wire Wire Line
	8950 3050 8950 3450
Connection ~ 8950 3450
Wire Wire Line
	8950 3450 9350 3450
Wire Wire Line
	1950 1850 1750 1850
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F7BDAE7
P 1150 1850
F 0 "#FLG0101" H 1150 1925 50  0001 C CNN
F 1 "PWR_FLAG" H 1150 2023 50  0000 C CNN
F 2 "" H 1150 1850 50  0001 C CNN
F 3 "~" H 1150 1850 50  0001 C CNN
	1    1150 1850
	1    0    0    -1  
$EndComp
Connection ~ 1150 1850
$Comp
L Device:R R2
U 1 1 5F7C1C51
P 9850 2850
F 0 "R2" V 9643 2850 50  0000 C CNN
F 1 "120" V 9734 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9780 2850 50  0001 C CNN
F 3 "~" H 9850 2850 50  0001 C CNN
	1    9850 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 2850 10000 3050
Wire Wire Line
	9700 2850 9700 2950
Wire Wire Line
	9350 3450 10550 3450
Connection ~ 9350 3450
Wire Wire Line
	10000 3050 10750 3050
Connection ~ 10000 3050
Wire Wire Line
	9700 2950 10750 2950
Connection ~ 9700 2950
$Comp
L LED:SK6812 D3
U 1 1 5F7E1C14
P 6150 3050
F 0 "D3" H 6250 3450 50  0000 L CNN
F 1 "SK6812" H 6250 3350 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 6200 2750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 6250 2675 50  0001 L TNN
	1    6150 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1850 6150 1850
Connection ~ 5250 1850
Wire Wire Line
	6150 2750 6150 1850
Connection ~ 6150 1850
Wire Wire Line
	6150 1850 7100 1850
Wire Wire Line
	5250 3450 6150 3450
Connection ~ 5250 3450
Wire Wire Line
	6150 3350 6150 3450
Connection ~ 6150 3450
Wire Wire Line
	6150 3450 7100 3450
Wire Wire Line
	5550 3050 5850 3050
$Comp
L LED:SK6812 D5
U 1 1 5F81C785
P 8050 3050
F 0 "D5" H 8150 3450 50  0000 L CNN
F 1 "SK6812" H 8150 3350 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 8100 2750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 8150 2675 50  0001 L TNN
	1    8050 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3050 7750 3050
Wire Wire Line
	8050 1850 8050 2750
Wire Wire Line
	8050 3350 8050 3450
Wire Wire Line
	7100 1850 8050 1850
Wire Wire Line
	7100 3450 8050 3450
Connection ~ 7100 1850
Connection ~ 7100 3450
Connection ~ 8050 1850
Connection ~ 8050 3450
NoConn ~ 2650 1950
$EndSCHEMATC
