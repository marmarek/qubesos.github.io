#!/bin/bash
# to be run from the git root
# $1 is lang
# $2 is directory where translated files reside and language needs to be added to internal urls
# TODO param check



echo "============================ post processing step 1 ======================================"
bash _utils/_translation_utils/prepare_tx_config_postprocess.sh .tx/config /tmp/tx-mapping
echo "============================ press any key to continue ======================================"
read b
echo "============================ post processing step 2 ======================================"
python _utils/_translation_utils/postprocess_translation.py $1 $2  /tmp/tx-mapping  /tmp/translated_href_urls.txt --yml
echo "============================ press any key to continue ======================================"
read b
echo "============================ post processing step 3 ======================================"
bash _utils/_translation_utils/postprocess_translation.sh $1 $2 /tmp/translated_href_urls.txt

echo "================================= build suite =================================="
bundle exec jekyll b
echo "================================= run htmlproofer ==============================="
htmlproofer ./_site   --disable-external   --checks-to-ignore ImageCheck   --file-ignore ./_site/video-tours/index.html,./_site/$1/video-tours/index.html --url-ignore "/qubes-issues/" --log-level debug 2&> /tmp/html.output 
echo "================================== as a last resort in case of errors process html proofer errors ================================="
python _utils/_translation_utils/postprocess_htmlproofer.py $1 /tmp/html.output $2

echo "================================= build the site and run htmlproofer ===================================="
rm -rf ./_site/
bundle exec jekyll b
htmlproofer ./_site   --disable-external   --checks-to-ignore ImageCheck   --file-ignore ./_site/video-tours/index.html,./_site/$1/video-tours/index.html --url-ignore "/qubes-issues/" --log-level debug  || all_ok=false

if $all_ok; then
    echo 'All checks passed!'
else
    echo 'Some checked failed. See above.'
    exit 1
fi


