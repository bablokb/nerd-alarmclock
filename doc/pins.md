GPIO-Pins used
==============

|Use           |Desc.    | Odd  | Even | Desc.     | Use                 |
|--------------|---------|-----:|:-----|-----------|---------------------|
|RTC           |3.3V     |   1  |  2   | 5V        | 4LpHat, Blinkt      |
|RTC, 4LpHat   |SDA      |   3  |  4   | 5V        |                     |
|RTC, 4LpHat   |SCL      |   5  |  6   | GND       | RTC, 4LpHat, Blinkt |
|Btn2          |GPIO04   |   7  |  8   |           |                     |
|Keyboard      |GND      |   9  | 10   |           |                     |
|Btn1          |GPIO17   |  11  | 12   |           |                     |
|Btn4          |GPIO27   |  13  | 14   | GND       |                     |
|Btn3          |GPIO22   |  15  | 16   | GPIO23    | Blinkt              |
|4LpHat        |3.3V     |  17  | 18   | GPIO24    | Blinkt              |
|              |SPI_MOSI |  19  | 20   | GND       |                     |
|              |SPI_MISO |  21  | 22   | GPIO25    | SNZ                 |
|              |SPI_CLK  |  23  | 24   | SPI_CE0_N |                     |
|              |GND      |  25  | 26   | SPI_CE1_N |                     |
|              |ID_SD    |  27  | 28   | ID_SC     |                     |
|EK1_CLK       |GPIO05   |  29  | 30   | GND       |                     |
|EK1_DT        |GPIO06   |  31  | 32   | GPIO12    | EK1_SW              |
|EK2_CLK       |GPIO13   |  33  | 34   | GND       |                     |
|EK2_DT        |GPIO19   |  35  | 36   | GPIO16    | EK2_SW              |
|IR            |GPIO26   |  37  | 38   | GPIO20    |                     |
|              |GND      |  39  | 40   | GPIO22    |                     |

Note that EK2_DT conflicts with the pHat-DAC. If you want to use both
the encoder-knob and the pHat-DAC, you have to connect the data-pin
of EK2 to a different pin and changes various files (see the README.md
for details).
