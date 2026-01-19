# stl from maps

Produziere STL dateien aus Geodaten von Österreich

Workflow

Zum Einrichten aller Daten
`setup.qmd`    
komplett ausführen

Dann `vektordaten.qmd` und `rasterdaten.qmd` ausführen. Damit weden alle
benötigten Geo-Dateien installiert.

`voeslau.qmd`      
ist ein Workflow zum erzeugen einer `tif` Datei, die in `QGIS`
in eine `STL` Datei konvertiert werden kann.      

In QGIS muss das Plugin `DEMTO3D` installiert sein.       
Mit `Layer -> Data Source Manager` importiert man dann das `tif` File
und mit `Raster -> DEMto3D` kann man die `stl` Datei für den 3D-Drucker 
generieren.



