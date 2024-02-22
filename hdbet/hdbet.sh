#!/bin/bash
cd ~/HD-BET/

# Function to process each file
process_file() {
    file=$1
    echo $file

    # remove basename of $file and add "bet" in front of the basename
    newfile=$(dirname $file)/bet_$(basename $file)

    if $gpu; then
      PYTHONPATH=. HD_BET/hd-bet -i $file -o $newfile
    else
      PYTHONPATH=. HD_BET/hd-bet -i $file -o $newfile -device cpu -mode fast -tta 0
    fi
    # Delete Original File
    rm $file
}
export -f process_file

echo ${jobs}
PYTHONPATH=. HD_BET/hd-bet -i "/app/init/init.nii.gz" -o "/app/init/initoutput.nii.gz" -device cpu -mode fast -tta 0
rm /app/init/initoutput.nii.gz
rm /app/init/initoutput_mask.nii.gz
echo "model downloaded. HD-BET is ready to process files"
# Execute HD-Bet
if $gpu; then
  find /output -type f -name "*.nii.gz" | parallel --jobs ${jobs} process_file
else  
  find /output -type f -name "*.nii.gz" | parallel process_file
fi