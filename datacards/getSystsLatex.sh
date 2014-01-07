#! /bin/bash

# Output systematics in Latex format

out=`cat $1 | grep "^sig"`

echo "Signal PDF (\%) & log normal & \multicolumn{4}{c|}{"$(echo "scale=2; (`echo $out | cut -d' ' -f5` - 1) * 100" | bc)"} \\\\"
echo "\hline"

out=`cat $1 | grep "^jec"`
echo "JEC (\%) & log normal & \multicolumn{4}{c|}{"$(echo "scale=2; (`echo $out | cut -d' ' -f5` - 1) * 100" | bc)"} \\\\"
echo "\hline"

out=`cat $1 | grep "^jer"`
echo "JER (\%) & log normal & \multicolumn{4}{c|}{"$(echo "scale=2; (`echo $out | cut -d' ' -f5` - 1) * 100" | bc)"} \\\\"
echo "\hline"

out=`cat $1 | grep "^pu"`
echo "PU reweighting (\%)& log normal & \multicolumn{4}{c|}{"$(echo "scale=2; (`echo $out | cut -d' ' -f5` - 1) * 100" | bc)"} \\\\"
echo "\hline"
