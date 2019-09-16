#!/bin/bash

# usage: ./bla $LANG $FILE $REF
pattern=`sed -n '/permalink:.*/{x;p;d;}; x' $2`
echo $pattern
sed -i "s/$pattern/$pattern \nlang: $1\nref: $3/g" $2



