#!/bin/bash
#./script $LANG $FILE $REF

traverse_dir_and_sed(){
	for filename in `ls -1 $2`; do
		if [[ -d filename ]]
		then traverse_dir_and_sed $1 $3 $filename;
		     ref=$?
		else
			echo 'read!!!! + '+ $filename	
			dummy_pattern='title: '
			pattern=`sed -n '/permalink:.*/{x;p;d;}; x' $filename`
			sed -i "s/$pattern/$pattern \nlang: $1\nref: $3/g" $filename
			sed -i "s/$dummy_pattern/$dummy_pattern $1/g" $filename
		fi
		ref=$(($ref+1))
	done
	return ref
}

traverse_dir_and_sed $1 $2 $3
ref=$?
echo 'last counter: '+$ref

