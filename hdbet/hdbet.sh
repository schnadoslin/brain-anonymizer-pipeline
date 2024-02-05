cd ~/HD-BET/
# Execute HD-Bet
files=$(find /output -type f -name "*.nii.gz")
# Iterate through the files
for file in $files; do
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
done