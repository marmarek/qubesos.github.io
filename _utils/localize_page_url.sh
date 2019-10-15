#!/bin/bash
# ./bla $FILE
lang_line=`sed -n '/^lang:.*/{p}' $1`
echo $lang_line
lang=(${lang_line//: / })
echo ${lang[1]}
url_lines=`sed -n '/^\[.*]: .*/{p}' $1`
# make distinction between relative urls and web urls, web do not touch
echo `declare -p url_lines`
urls=(${url_lines// / })

echo $url_lines
echo $urls
echo $url_lines



