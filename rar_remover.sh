#!/bin/bash

read -p "Enter the path that should be scaned: " SEARCH_DIR

# Check, if the user entered a path
if [ -z "$SEARCH_DIR" ]; then
    echo "No path entered. Shutting down the script!"
    exit 1
fi

# Check, if path exits
if [ ! -d "$SEARCH_DIR" ]; then
    echo "This path don't exists. Shutting down the script!"
    exit 1
fi

# Rekursive Suche nach .rar Dateien
RAR_FILES=$(find "$SEARCH_DIR" -type f -name "*.rar")

# Check if .rar files were found
if [ -z "$RAR_FILES" ]; then
    echo "No .rar files found."
    exit 0
fi

# Liste der gefundenen .rar Dateien anzeigen
echo "Found .rar files:"
echo "$RAR_FILES"

# y/n Abfrage
read -p "Do you want to delete this files? (y/n): " answer

# Entscheidung basierend auf der Benutzereingabe
case $answer in
    [Yy]* ) 
        echo "Delete the.rar files..."
        # Löschen der .rar Dateien
        find "$SEARCH_DIR" -type f -name "*.rar" -exec rm -v {} \;
        echo "All .rar files were deleted!"
        ;;
    [Nn]* ) 
        echo "Error, no files were deleted"
        ;;
    * ) 
        echo "Error!"
        ;;
esac

