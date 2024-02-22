#!/bin/bash
# Dicom-Dateien in nifti konvertieren

# Get a list of directories that contain .dcm files
directories=$(find /output -type d -exec sh -c 'ls -1 "{}"/*.dcm >/dev/null 2>&1 && echo "{}"' \;)
# Iterate through the directories and convert .dcm files to nifti

# Iterate through the directories and convert .dcm files to nifti
echo "$directories" | parallel 'dcm2niix -o {} -z y {}'

# Remove the original .dcm files
find /output -type f -name "*.dcm" -exec rm {} \;