#!/bin/bash

echo "=================================="
echo "        BENUTZERPRÜFUNG"
echo "=================================="

echo ""
echo "👤 Bitte Benutzernamen eingeben:"
read benutzer

if id "$benutzer" &>/dev/null
then
    echo ""
    echo "✅ Benutzer existiert."

    echo ""
    echo "📋 Benutzerinformationen:"
    id "$benutzer"

    echo ""
    echo "👥 Gruppen:"
    groups "$benutzer"
else
    echo ""
    echo "❌ Benutzer existiert nicht."
fi

echo ""
echo "=================================="
echo "           FERTIG"
echo "=================================="
