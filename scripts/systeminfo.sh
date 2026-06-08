#!/bin/bash

echo "=================================="
echo "      SYSTEMINFORMATIONEN"
echo "=================================="

echo ""
echo "👤 Benutzer:"
whoami

echo ""
echo "💻 Rechnername:"
hostname

echo ""
echo "📅 Datum und Uhrzeit:"
date

echo ""
echo "📂 Aktuelles Verzeichnis:"
pwd

echo ""
echo "🖥️ Betriebssystem:"
uname -a

echo ""
echo "💾 Speicherplatz:"
df -h

echo ""
echo "⚙️ Arbeitsspeicher:"
free -h

echo ""
echo "=================================="
echo "Fertig."
echo "=================================="
