#!/bin/bash
# first argument is the language for which the translated files should be downloaded
# the mode developer will download all unreviewed translated strings as well
tx pull -l $1 --mode reviewed -d --traceback -r qubes.*_doc*
tx pull -l $1 --mode reviewed -d --traceback -r qubes.*_pages*
tx pull -l $1 --mode reviewed -d --traceback -r qubes.*_news*

# the different mode here is needed for YAML files, since the developer mode does not download source strings if untranslated
# the mode reviewed here will not work and will return empty strings for nontranslated ones
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.*_data_*
