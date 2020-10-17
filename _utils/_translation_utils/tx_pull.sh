#!/bin/bash
# first argument is the language for which the translated files should be downloaded
# the mode developer will download all unreviewed translated strings as well
tx pull -l $1 --mode reviewed -d --traceback -r qubes.no_html_doc*
tx pull -l $1 --mode reviewed -d --traceback -r qubes.no_html_pages*

# the different mode here is needed for YAML files, since the developer mode does not download source strings if untranslated
# the mode reviewed here will not work and will return empty strings for nontranslated ones
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_hcl
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_architecture
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_style_guide_content
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_download
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_intro
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_partners
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_videos
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_experts
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_home
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_teamtexts
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_includes
tx pull -l $1 --mode sourceastranslation -d --traceback -r qubes.no_html_data_index
