# BFH Physik 2 Individualprojekt
## Ziel
Eine Tonquelle im 2D Raum lokalisieren können.

## Methode
Drei Mikrofone in einer Reihe erkennen nacheinander den Amplitudenanstieg und messen die Zeitdifferenz zwischen ihnen. Die beiden Winkel von den letzten erreichten Mikrofonen zum ersten Mikrofon werden als Mittelwert gerechnet, um die Präzision zu erhöhen.

## Realisierung
### Hardware
Ich entschied mich Mikrofonkapseln des Typs MCE-101 zu kaufen und die Verstärkerschaltung selber mithilfe eines Verstärker ICs zu realisieren.
Aufgrund der mir passenden Merkmale (Spannung, Verstärkung) sowie der Erhältlichkeit im DIP Format, wählte ich den LM386 IC von Texas Instruments.
Die Grundschaltung ist einfach aufzubauen und erfordert nicht allzu viele weitere Bauteile.
Somit zeichnete ich das folgende Schema, welches ich in dreifacher Ausführung auf einer Lochplatine mit den Bauelementen lötete.
![Schema](img/schema.png)

Hinweis: Das Schema ist als KiCAD Projekt im Verzeichnis `soundtracker/` hinterlegt.

Nach einem Check mit dem Oszilloskop nahm ich alle drei Verstärkerschaltungen und baute diese wie einen Turm aufeinander. Die Mikrofone befestigte ich in einer Holzleiste.
![Checkaufbau](img/oszi_schema.jpg)
Man beachte die Amplitudenverschiebung.

![Check](img/oszi.png)
![Aufbau](img/aufbau.jpg)

Nach der Fertigstellung und der Verdrahtung mit dem Arduino sieht der Aufbau wie folgt aus:

![DSC_0017.JPG](img/DSC_0017.JPG)
![DSC_0018.JPG](img/DSC_0018.JPG)
![DSC_0020.JPG](img/DSC_0020.JPG)
![DSC_0021.JPG](img/DSC_0021.JPG)
![DSC_0022.JPG](img/DSC_0022.JPG)
![DSC_0023.JPG](img/DSC_0023.JPG)

### Software
Da ich kein Fan der Arduino Bibliotheken bin, entschied ich mich die Software in C mit der avr-libc zu entwickeln.

#### Prescaler
Da der Analog-Digital-Converter des AtMega328p eine maximale Auflösung von 10 Bit bei einer `input clock frequency between 50kHz and 200kHz` hat, und ich diese überziehen will, liess ich 200 Sampels mit einer Clock Frequency von 1MHz (Prescaler: 16) aufnehmen und plottete es aus:
% TODO

Da dies für mich noch immer genug präzis ist, ging ich weiter an die Implementierung.

#### Zeitmessung
#### Positionsbestimmung

# Literatur
- LM-386 Verstärker http://www.ti.com/lit/ds/symlink/lm386.pdf
- AVR libC http://www.atmel.com/webdoc/avrlibcreferencemanual/group__avr__sfr_1gaaf6857fa882da35f8685e2001e5c3bbe.html
- ATmega328p http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf
