#!/bin/bash
######
# Moves the star formation histories from accacia to the 4c3r2 repo.
######
# Loop over snapshots (0-201)
for SNAPSHOT in {0..201}; do
  # Loop over subvolumes (0-63)
  for SUBVOLUME in {0..63}; do
    echo "Processing snapshot $SNAPSHOT, subvolume $SUBVOLUME..."

    # Clone the file
    rclone --progress copy \
      pawsey0119:clagos/SHARK_Out/medi-SURFS/Sharkv2-Lagos23-HBTTrees-bestparams/$SNAPSHOT/$SUBVOLUME/star_formation_histories.hdf5 \
      /scratch/pawsey0335/tlambert/mock_catalogues/4c3r2/star_formation_histories/

    # Check if clone was successful
    if [ $? -eq 0 ]; then
      # Rename the file
      mv /scratch/pawsey0335/tlambert/mock_catalogues/4c3r2/star_formation_histories/star_formation_histories.hdf5 \
        /scratch/pawsey0335/tlambert/mock_catalogues/4c3r2/star_formation_histories/sfh_${SNAPSHOT}_${SUBVOLUME}.hdf5
      echo "Successfully processed snapshot $SNAPSHOT, subvolume $SUBVOLUME"
    else
      echo "Error cloning snapshot $SNAPSHOT, subvolume $SUBVOLUME"
    fi
  done
done

echo "All files processed!"
