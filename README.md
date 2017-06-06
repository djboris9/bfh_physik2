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
Die Arduino Bibliotheken stellen m.E. eine Abstraktonsschicht mit unbekannten Nebeneffekten da,
welche ich insbesondere für solche Zeitmessungen vermeiden will. Deshalb entschied ich mich die Software in C mit der Atmel avr-libc zu entwickeln.

#### Entwicklungsumgebung
* Compiler: `avr-gcc (GCC) 7.1.0`
* Linker: `GNU ld (GNU Binutils) 2.28`
* Binutils: `GNU Binutils 2.28`
* Programmer: `avrdude version 6.3`

#### Prescaler
Da der Analog-Digital-Converter des ATmega328p eine maximale Auflösung von 10 Bit bei einer `input clock frequency between 50kHz and 200kHz` hat, und ich diese überziehen will, liess ich 200 Sampels mit einer Clock Frequency von 1MHz (Prescaler: 16) aufnehmen und plottete es aus:

% TODO

Da dies für mich noch immer genug präzis ist, ging ich weiter an die Implementierung.

#### Zeitmessung
In einem Loop prüfe ich, ob der analoge Wert irgendeines Mikrofones auf über 600 ansteigt (`BREAKOUT_LEVEL`). Falls dies zutrifft setze ich den 16-Bit Timer auf 0 und fahre mit dem Loop fort, wobei ich beim erreichen des breakout levels für die anderen beiden Mikrofone den Timerwert in einer Variable speichere. Erreichten alle Mikrofone mal diesen Wert, werte ich das Ergebnis aus, schicke es über UART weiter und warte zwei Sekunden, bis die Routine von vorne beginnt.

#### Serielle Kommunikation
Als Schnittstelle zwischen dem ATmega und weiterer Peripherie wählte ich UART, da es aufgrund der Arduino Architektur über USB als serielle Schnittstelle (`USB ACM device`) erkannt wird. Die Schnittstelle wird nur sendend auf 9600 baud verwendet, wobei zum Senden auf die `stdio` von avr-libc zurückgegriffen wird.

#### Positionsbestimmung
% TODO

# Literatur
- LM-386 Verstärker http://www.ti.com/lit/ds/symlink/lm386.pdf
- AVR libC http://www.atmel.com/webdoc/avrlibcreferencemanual/group__avr__sfr_1gaaf6857fa882da35f8685e2001e5c3bbe.html
- ATmega328p http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf
