#! /bin/bash

# Split a datacard in mu and e flavor

file=$1
output=splitted/${file%.txt}_mu.txt

# Header
sed -n -e "1,4p" $file | sed "s/imax 2/imax 1/" > $output

#
sed -n 5,7p $file | tr -s " " | cut -d " " -f 1-2 >> $output

sed -n 8,9p $file >> $output

# Rates
sed -n 10,14p $file | tr -s " " | cut -d " " -f 1-3 >> $output

# Systematics

sed -n -e '15,$p' $file | tr -s " " | cut -d " " -f 1-2,3-4 >> $output

output=splitted/${file%.txt}_e.txt

# Header
sed -n -e "1,4p" $file | sed "s/imax 2/imax 1/" > $output

#
sed -n 5,7p $file | tr -s " " | cut -d " " -f 1,3 >> $output

sed -n 8,9p $file >> $output

# Rates
sed -n 10,14p $file | tr -s " " | cut -d " " -f 1,4-5 >> $output

# Systematics

sed -n -e '15,$p' $file | tr -s " " | cut -d " " -f 1-2,5-6 >> $output
