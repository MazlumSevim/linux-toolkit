#!/bin/bash

echo "=================================="
echo "      SPEICHERPLATZ-PRÜFUNG"
echo "=================================="

echo ""
echo "💾 Festplattenübersicht:"
df -h

echo ""

belegt=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "📊 Belegter Speicherplatz: $belegt%"

echo ""

if [ "$belegt" -ge 80 ]
then
    echo "⚠️ Warnung: Speicherplatz über 80% belegt!"
else
    echo "✅ Speicherplatz ist in Ordnung."
fi

echo ""
echo "=================================="
echo "Fertig."
echo "=================================="
