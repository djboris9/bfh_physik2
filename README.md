# BFH Physik 2 Individualprojekt
## Ziel
Tonquelle im 2D Raum lokalisieren können.

## Methode
Drei Mikrofone in einer Reihe erkennen nacheinander den Amplitudenanstieg und messen die Zeitdifferenz zwischen ihnen. Die beiden Winkel von den letzten erreichten Mikrofonen zum ersten Mikrofon werden als Mittelwert gerechnet, um die Präzision zu erhöhen.

## Hardware
Das Schema ist als KiCAD Projekt im Verzeichnis `soundtracker/` hinterlegt.

### Bilder der Realisierung
![DSC_0017.JPG](img/DSC_0017.JPG)
![DSC_0018.JPG](img/DSC_0018.JPG)
![DSC_0020.JPG](img/DSC_0020.JPG)
![DSC_0021.JPG](img/DSC_0021.JPG)
![DSC_0022.JPG](img/DSC_0022.JPG)
![DSC_0023.JPG](img/DSC_0023.JPG)


# Literatur
- https://www.arduino.cc/en/Hacking/Atmega168Hardware
- https://de.wikibooks.org/wiki/C-Programmierung_mit_AVR-GCC/_IO-Ports
- http://www.atmel.com/webdoc/avrlibcreferencemanual/group__avr__sfr_1gaaf6857fa882da35f8685e2001e5c3bbe.html
- http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf
