#!/bin/bash

# ./this $LANG $FILE $DEBUG
# ./this de donate.md debug
DEBUG=$3
#escape spaces 
# w="${str/ /\\ }"
#escape [
# w="${w/[/\\[}"
#escape ]
# w="${w/]/\\]}"
#escape /
# str="${str//\//\\}"
#escape *
# w="${w/*/\\*}"
#escape :
#w="${w/:/\\:}"
#escape (
#w="${w/(/\\(}"
#escape )
#w="${w/)/\\)}"

function echoing(){
	if [[ -n "$DEBUG" ]]; then 
		echo $1
	fi;
}

#format of pages

grep  "]: /" $2 | while read line; do echoing $line; beginning=${line%]: /*}; echoing "line: "; echoing "$beginning"; ending=${line##*]: /};echoing "before if "; if [[ $ending == $1* ]]; then echoing "IN IF"; else echoing "IN ELSE"; echoing "end of line: "; echoing "$ending"; replace=$beginning"]: /$1/"$ending; pattern="${beginning/ /\\ }"; echoing "PATTERN TO REPLACE: "; echoing "$pattern"; pattern="${pattern/[/\\[}";echoing "escaped 1: "; echoing "$pattern"; pattern=$pattern".*";echoing "escaped 2: "; echoing "$pattern"; echoing " TO REPLACE WITH: "; echoing "$replace"; replace="${replace/ /\\ }"; echoing "escaped 1: "; echoing "$replace"; replace="${replace/: /:\\ }"; echoing "escaped 2: "; echoing "$replace";replace="${replace/[/\\[}"; echoing "escaped 3: "; echoing "$replace";replace="${replace/]/\\]}"; echoing "escaped 4: "; echoing "$replace";replace="${replace//\//\\/}";echoing "escaped 5: "; echoing "$replace"; replace="${replace/\/#/\/\\#}"; echoing "escaped 6: "; echoing "$replace"; sed -i "s#^$pattern#$replace#g" $2; fi; done



