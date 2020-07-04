#!/bin/bash
# param 1 the news index html file cat news/index.html 
# param 2 yaml file to be uploaded
cat $1 | egrep -o 'title:(.*)' > $2
