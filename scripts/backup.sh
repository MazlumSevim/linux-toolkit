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

# Backup-Hauptordner
backupordner="backup"

# Backup-Ordner erstellen, falls nicht vorhanden
if [ ! -d "$backupordner" ]
then
    mkdir "$backupordner"
    echo "📁 Backup-Ordner wurde erstellt."
else
    echo "📁 Backup-Ordner existiert bereits."
fi

# Datum und Uhrzeit für eindeutigen Backup-Ordner
datum=$(date +"%Y-%m-%d_%H-%M-%S")

# Neuer Backup-Ordner
ziel="$backupordner/backup_$datum"

mkdir "$ziel"

echo ""
echo "📦 Starte Backup..."

# Ordner sichern
rsync -av "$quelle" "$ziel/"

# Erfolg prüfen
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
    echo "📋 Gesicherte Dateien:"
    ls -lah "$ziel"
else
    echo ""
    echo "❌ Fehler beim Erstellen des Backups."
    exit 1
fi

echo ""
echo "=================================="
echo "           FERTIG"
echo "=================================="
