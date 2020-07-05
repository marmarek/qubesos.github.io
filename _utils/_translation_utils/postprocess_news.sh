#!/bin/bas
# param 1 lang
# param 2 root dir
#####################################################
# with the html sed does not replace, so it is partially broken
# TODO requires manual reparation? idk what I meant here
#####################################################

dir=_qubes-translated/$1/aux/

if [ ! -d "$dir" ]; then
	# nothing was translated
	# do nothing
	echo "no news strings were translated, nothing to do, exiting ... "
	exit 0
fi

news_categories_translated=$2/_qubes-translated/$1/news/categories/index.html
news_translated=$2/_qubes-translated/$1/news/index.html

news_categories=$2/news/categories/index.html
news_file=$2/news/index.html

news_title=`cat $news_file| egrep -o 'title:(.*)'`
echo $news_title
news_cat_title=`cat $news_categories | egrep -o 'title:(.*)'`
echo $news_cat_title
news_string1=`cat $news_categories | egrep -o '<h1>(.*)</h1>'`
echo $news_string1
news_string2=`cat $news_categories | egrep -o '<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>(.*)</a>'`
echo $news_string2


news_aux_translated=$2/_qubes-translated/$1/aux/news_strings.yml
news_categories_aux_translated=$2/_qubes-translated/$1/aux/news_categories_strings.yml

if [ -f "$news_categories_aux_translated" ]; then

	mkdir -p $2/_qubes-translated/$1/news/categories/
	cp $news_categories $news_categories_translated
	news_cat_title_transl=`cat $news_categories_aux_translated | egrep -o 'title:(.*)'`
	echo replacing [$news_cat_title] with [$news_cat_title_transl]
	sed -i 's/$news_cat_title/$news_cat_title_transl/g' $news_categories_translated

	news_string1_transl=`cat $news_categories_aux_translated | egrep -o '<h1>(.*)</h1>'`
	string1=$(echo "$news_string1_transl" | sed -r 's/\//\\\//g')
	echo replacing [$news_string1] with [$string1] in $news_categories_translated
	sed -i 's/$news_string1/$string1/g' $news_categories_translated

	news_string2_transl=`cat $news_categories_aux_translated | egrep -o '<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>(.*)</a>'`
	string2=$(echo "$news_string2_transl" | sed -r 's/\//\\\//g')
	echo replacing [$news_string2] with [$string2]
	sed -i 's/$news_string2/$string2/g' $news_categories_translated
fi

if [ -f "$news_aux_translated" ]; then
	mkdir -p $2/_qubes-translated/$1/news/
	cp $news_file $news_translated
	news_title_transl=`cat $news_aux_translated | egrep -o 'title:(.*)'`

	echo replacing [$news_title] with [$news_title_transl]
	sed -i "s/$news_title/$news_title_transl/g" $news_translated
fi

