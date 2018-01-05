# Fysio

#### Een programma om electromyografie te analyseren

### Gebruik

Het programma kan opgestart worden door het matlab script fysio.m te runnen.<br>
Hierdoor komt een window tevoorschijn waarop 6 lege grafieken te zien zijn.<br>
De drie linkse grafieken stellen het tijdsdomein van de drie dimensies voor.<br>
De drie rechtse grafieken zijn de frequentiedomeinen van de overeenkomstige grafieken.<br>
Links naast de grafieken ziet u ook enkele opties.<br>
De eerste knop "Load" kan gebruikt worden om een bepaald excel document in te laden.<br>
De data van deze file wordt dan geplot in de zes grafieken.<br>
Rechts bovenaan zal de filenaam van het gekozen bestand tevoorschijn komen.<br>
De "Save" knop dient voor de bewerkte data die u bekomen heeft op te slaan.

##### Cut-off frequency
Daaronder staat een Cut-off frequency slider. Deze slider kan gebruikt worden om de hoge frequenties uit het frequentiedomein te halen, en zo de noise te filteren.<br>
De frequentie die boven de slider geeft weer hoeveel frequenties er weergegeven worden.<br>
Deze functie kan dus gebruikt worden om noise, die zich in de hoge frequenties bevindt, te verwijderen.<br>
Om de originele functie te kunnen vergelijken met de bewerkte functie, kan u rechts een keuze maken tussen drie weergaven van het tijdsdomein.

##### Time domain
Als u "Original" kiest, zullen de drie linkse grafieken steeds de originele functie laten zien.<br>
Als u "Cut-off" kiest, zullen de drie linkse grafieken steeds de bewerkte functie laten zien.<br>
Als u "Both" kiest, zullen de drie linkse grafieken beide grafieken op elkaar laten zien, de originele functie in het rood en de bewerkte functie in het blauw.

Onder de frequentie slider kan u de keuze maken welke mode u wil gebruiken om de functies te bekijken.<br>
Met mode "Zoom" kan u inzoomen op elke functie.<br>
Met mode "Cursor" kan u een cursor plaatsen op elke functie en de bijhorende waarden aflezen.<br>
Daaronder kan nog een tweede keuze gemaakt worden. Deze geeft u de keuze of u in het frequentiedomein de power of de waarde van de functie wil bekijken.

##### Analysis windows
Uiteindelijk, helemaal links onderaan kan u 1 van 8 window functies selecteren.

### Opmerkingen

Om het spectrum gegenereren gebeuren de volgende stappen:

  - Van het signaal wordt het gemiddelde afgetrokken. (`detrend`)
  - De window wordt toegepast op het signaal.
  - Er wordt een FFT genomen, met 10*N punten. Er worden dus 9 lengtes zero padding gebruikt.
  - De cut-off frequency wordt omgezet in een boxcar, en toegepast.

Om het aangepaste tijdsdomein (met cut-off) te genereren worden bovenstaande stappen gebruikt, maar er  wordt geen `detrend` toegepast. Dit zorgt ervoor dat de twee tijdsdomein signalen (originele en cut-off) op dezelfde plaats liggen.
