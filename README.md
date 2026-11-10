# Leerhelden

Taalhelden (Nederlands en Engels), Rekenhelden, Topohelden en de leer- en toetsroutes in één statische website.

## Uploaden vanaf iPhone

1. Open het gedownloade ZIP-bestand in Bestanden.
2. Maak op GitHub een privé-repository met eigenaar `baskman-cmyk` en naam `Leerhelden`.
3. Upload alle losse bestanden uit de uitgepakte map `Leerhelden` naar de hoofdmap van de repository en kies **Commit changes**. In een lege repository staat **uploading an existing file** op de startpagina.
4. Importeer `baskman-cmyk/Leerhelden` in je persoonlijke Vercel Hobby-project. Laat de Root Directory op de hoofdmap staan en kies **Deploy**. De instellingen staan in `vercel.json`.

De ZIP is een downloadverpakking. De losse `site-part-*`-bestanden zijn delen van de volledige site, passend binnen de uploadlimiet per bestand van GitHub. Laat de namen staan. Vercel pakt tijdens de build de site uit naar `dist/`.

## Lokaal uitpakken en bewerken

Voer `bash build.sh` uit in de hoofdmap. De HTML-, CSS-, JavaScript- en databestanden staan daarna in `dist/`. Serveer die map via een lokale HTTP-server om de site te bekijken. Als je de bestanden later rechtstreeks als `dist/` in GitHub zet, gebruikt dezelfde Vercel-configuratie die map.
