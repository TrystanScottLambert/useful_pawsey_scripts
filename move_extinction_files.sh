#!/bin/bash
#####
# Move the extinction fils from accacia to the pawsey space.
#####

for i in $(seq -w 0 63); do
  SRC="pawsey0119:clagos/Stingray/medi-SURFS/Sharkv2-Lagos23-HBTTrees-bestparams/waves-wide/extinction-eagle-rr14_${i}.hdf5"
  DST="/scratch/pawsey0119/tlambert/mock_catalogs/4c3r2/extinction/"

  echo "Copying file with index ${i}..."
  rclone --progress copy "$SRC" "$DST"
done
