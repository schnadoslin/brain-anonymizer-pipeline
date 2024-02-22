#!/bin/bash
# Ordnerstruktur kopieren
cd /input
find ./* -type d -exec mkdir -p -- /output/{} \;
# Dicom-Dateien anonymisieren
find ./* -type f -name "*.dcm" | parallel -q  dicom-anonymizer {} /output/{} -t '(0x0020,0x000E)' keep -t '(0x0020,0x0011)' keep  \;
