#!/bin/bash

echo "=================================="
echo "         BACKUP-SKRIPT"
echo "=================================="

echo ""
echo "📁 Welcher Ordner soll gesichert werden?"
read quelle

# Prüfen, ob der Quellordner existiert
if [ ! -d "$quelle" ]
then
    echo "❌ Fehler: Der Ordner '$quelle' existiert nicht."
    exit 1
fi

# Backup-Ordner festlegen
ziel="backup"

# Prüfen, ob Backup-Ordner existiert
if [ -d "$ziel" ]
then
    echo "📁 Backup-Ordner existiert bereits."
else
    mkdir "$ziel"
    echo "📁 Backup-Ordner wurde erstellt."
fi

echo ""
echo "📦 Starte Backup..."

# Ordner sichern
rsync -av "$quelle/" "$ziel/"

if [ $? -eq 0 ]
then
    echo ""
    echo "✅ Backup erfolgreich erstellt!"

    echo ""
    echo "📂 Quelle:"
    realpath "$quelle"

    echo ""
    echo "📂 Ziel:"
    realpath "$ziel"

    echo ""
    echo "📋 Inhalt des Backup-Ordners:"
    ls -lh "$ziel"
else
    echo ""
    echo "❌ Fehler beim Erstellen des Backups."
    exit 1
fi

echo ""
echo "=================================="
echo "           FERTIG"
echo "=================================="
