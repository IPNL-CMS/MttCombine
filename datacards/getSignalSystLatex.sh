#! /bin/bash

# Output signal systematics in LaTeX format

out=`cat $1 | grep "^sig"`

echo -n "\multicolumn{4}{c|}{"$(echo "(`echo $out | cut -d' ' -f5` - 1) * 100" | bc)"}"
echo ""
