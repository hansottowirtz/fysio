# Fysio

#### Een programma om electromyografie te analyseren

Het programma kan opgestart worden door het matlab script fysio.m te runnen.
Hierdoor komt een window tevoorschijn waarop 6 lege grafieken te zien zijn.
De drie linkse grafieken stellen het tijdsdomein van de drie dimensies voor.
De drie rechtse grafieken zijn de frequentiedomeinen van de overeenkomstige grafieken.
Links naast de grafieken ziet u ook enkele opties.
De eerste knop "Load" kan gebruikt worden om een bepaald excel document in te laden.
De data van deze file wordt dan geplot in de zes grafieken.
Rechts bovenaan zal de filenaam van het gekozen bestand tevoorschijn komen.
De "Save" knop dient voor de bewerkte data die u bekomen heeft op te slaan.
Daaronder staat een Cut-off frequency slider. Deze slider kan gebruikt worden om de hoge frequenties uit het frequentiedomein te halen.
De frequentie die boven de slider geeft weer hoeveel frequenties er weergegeven worden.
Deze functie kan dus gebruikt worden om noise, die zich in de hoge frequenties bevindt, te verwijderen.
Om de originele functie te kunnen vergelijken met de bewerkte functie, kan u rechts een keuze maken tussen drie weergaven van het tijdsdomein.
Als u "Original" kiest, zullen de drie linkse grafieken steeds de originele functie laten zien.
Als u "Cut-off" kiest, zullen de drie linkse grafieken steeds de bewerkte functie laten zien.
Als u "Both" kiest, zullen de drie linkse grafieken beide grafieken op elkaar laten zien, de originel functie in het rood en de bewerkte functie in het blauw.
Onder de frequentie slider kan u de keuze maken welke mode u wil gebruiken om de functies te bekijken.
Met mode "Zoom" kan u inzoomen op elke functie.
Met mode "Cursor" kan u een cursor plaatsen op elke functie en de bijhorende waarden aflezen.
Daaronder kan nog een tweede keuze gemaakt worden. Deze geeft u de keuze of u in het frequentiedomein de power of de waarde van de functie wil bekijken.
Uiteindelijk, helemaal links onderaan kan u 1 van 8 window functies selecteren.
