#!/bin/bash
# param 1 the news categories html file cat news/categories/index.html 
# param 2 yaml file to be uploaded
cat $1 | egrep -o 'title:(.*)' > $2
cat $1 | egrep -o '<h1>(.*)</h1>' | sed 's/^/string1: /' >>$2
cat $1 | egrep -o '<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>(.*)</a>' | sed 's/^/string2: /' >> $2

