#!/bin/bash

read -p "Bitte geben Sie den Pfad ein, in dem nach .rar Dateien gesucht werden soll: " SEARCH_DIR

# Überprüfen, ob der Benutzer einen Pfad eingegeben hat
if [ -z "$SEARCH_DIR" ]; then
    echo "Kein Pfad eingegeben. Beende das Skript."
    exit 1
fi

# Überprüfen, ob der Pfad existiert
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Der angegebene Pfad existiert nicht. Beende das Skript."
    exit 1
fi

# Rekursive Suche nach .rar Dateien
RAR_FILES=$(find "$SEARCH_DIR" -type f -name "*.rar")

# Überprüfen, ob .rar Dateien gefunden wurden
if [ -z "$RAR_FILES" ]; then
    echo "Keine .rar Dateien gefunden."
    exit 0
fi

# Liste der gefundenen .rar Dateien anzeigen
echo "Gefundene .rar Dateien:"
echo "$RAR_FILES"

# y/n Abfrage
read -p "Möchtest du alle diese Dateien löschen? (y/n): " answer

# Entscheidung basierend auf der Benutzereingabe
case $answer in
    [Yy]* ) 
        echo "Lösche die .rar Dateien..."
        # Löschen der .rar Dateien
        find "$SEARCH_DIR" -type f -name "*.rar" -exec rm -v {} \;
        echo "Alle .rar Dateien wurden gelöscht."
        ;;
    [Nn]* ) 
        echo "Abbruch. Keine Dateien wurden gelöscht."
        ;;
    * ) 
        echo "Ungültige Eingabe. Abbruch."
        ;;
esac

