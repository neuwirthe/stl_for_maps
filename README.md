# stl from maps

Produktion vn STL dateien aus Geodaten von Österreich


Wir verwenden mehrere Datenquellen

## Vektordaten der Verwaltungsgrenzen      
(enthält Katastralgemeinden, Gemeinden, Politischen Bezirken usw.)
Die Verwendung wird in den Beispieldateien illustriert.


#### Verwaltungsgrenzen Österreich 1:50.000
https://www.data.gv.at/datasets/6d731e6e-7dcf-4bde-8061-d0e195f62f6c?locale=de

#### Verwaltungsgrenzen Österreich 1:250.000
https://www.data.gv.at/datasets/d960f393-0a19-43f7-b2f1-2a79d9fc6fdd?locale=de

#### Bezirksgrenzen Wien
https://www.data.gv.at/datasets/2ee6b8bf-6292-413c-bb8b-bd22dbb2ad4b?locale=de

#### Verwaltungsgrenzen Wien
https://www.data.gv.at/datasets/1a22d558-544a-46c1-95b9-baa77d2bb485?locale=de

https://nextcloud.bev.gv.at/nextcloud/public.php/dav/files/yc7BpiibREyFrqH

## Geländedateien (DTM = Digital Terrain Model)
(ohne Gebäude und Vegetation) (DTM = Digital Terrain Model)

#### Österreich 10m 
https://www.data.gv.at/datasets/d88a1246-9684-480b-a480-ff63286b35b7?locale=de

#### Österreich 1m 
in Kacheln

https://www.bev.gv.at/Services/Produkte/Digitales-Gelaendehoehenmodell/ALS-Hoehenraster.html
siehe beiliegende Datei `ALS_Kachelübersicht.pdf`

## Oberflächendateien (DSM = Digital Surface Model)
https://www.bev.gv.at/Services/Produkte/Digitales-Oberflaechenmodell/Digitales-Oberflaechenmodell.html

#### Wien 0,5m

https://www.wien.gv.at/ma41datenviewer/public/start.aspx



siehe beiliegende Datei `ALS_Kachelübersicht.pdf`


https://www.data.gv.at/datasets?query=DTM+&locale=de&page=1




Workflow

Zum Einrichten aller Daten
`setup.qmd`    
komplett ausführen

Dann `vektordaten.qmd` und `rasterdaten.qmd` ausführen. Damit weden alle
benötigten Geo-Dateien installiert.

`voeslau.qmd`      
ist ein Workflow zum erzeugen von `tif` Datei, die in `QGIS`
in eine `STL` Datei konvertiert werden können.    
Diese Dateien werden im Folder `for_stl` abgelegt.


Es gibt dann ein Geländemodell der ganzen Gemeinde und ein Oberflächenmodell
des Stadtzentrums

In QGIS muss das Plugin `DEMTO3D` installiert sein.       
Mit `Layer -> Data Source Manager` importiert man dann das `tif` File
und mit `Raster -> DEMto3D` kann man die `stl` Datei für den 3D-Drucker 
generieren.



