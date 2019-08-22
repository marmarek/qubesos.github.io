#!/bin/bash

pattern=`sed -n '/=========.*/{x;p;d;}; x' $2`
echo $pattern
sed -i "s/$pattern/$1 $pattern/g" $2



