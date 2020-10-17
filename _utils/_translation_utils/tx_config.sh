#!/bin/bash
# to be run from the git root
# TODO how to incoporate them back, no need
#bash _utils/_translation_utils/extract_news_categories_html.sh news/categories/index.html aux/news_categories_strings.yml
#bash _utils/_translation_utils/extract_news_html.sh news/index.html aux/news_strings.yml
# TODO do we want to translate also the research section?

tx config mapping-bulk -p qubes --source-language en  --type GITHUBMARKDOWN -f '.md' -d --source-file-dir _doc/en/_doc/ -i _dev --expression '_qubes-translated/<lang>/_doc/{filepath}/{filename}{extension}'   --execute
tx config mapping-bulk -p qubes --source-language en --type GITHUBMARKDOWN -f '.md' -d --source-file-dir pages --expression '_qubes-translated/<lang>/pages/{filepath}/{filename}{extension}' --execute
# TODO several main news strings csn be translated at least
#tx config mapping-bulk -p qubes --source-language en --type GITHUBMARKDOWN -f '.md' -d --source-file-dir news --expression '_qubes-translated/<lang>/news/{filepath}/{filename}{extension}' --execute
tx config  mapping -r qubes.data_architecture --source-lang en --type YAML_GENERIC --source-file _data/architecture.yml --expression '_qubes-translated/<lang>/_data/<lang>/architecture.yml' --execute
tx config  mapping -r qubes.data_index --source-lang en --type YAML_GENERIC --source-file _data/index.yml --expression '_qubes-translated/<lang>/_data/<lang>/index.yml' --execute
tx config  mapping -r qubes.data_includes --source-lang en --type YAML_GENERIC --source-file _data/includes.yml --expression '_qubes-translated/<lang>/_data/<lang>/includes.yml' --execute
tx config  mapping -r qubes.data_teamtexts --source-lang en --type YAML_GENERIC --source-file _data/teamtexts.yml --expression '_qubes-translated/<lang>/_data/<lang>/teamtexts.yml' --execute
tx config  mapping -r qubes.data_home --source-lang en --type YAML_GENERIC --source-file _data/home.yml --expression '_qubes-translated/<lang>/_data/<lang>/home.yml' --execute
tx config  mapping -r qubes.data_experts --source-lang en --type YAML_GENERIC --source-file _data/experts.yml --expression '_qubes-translated/<lang>/_data/<lang>/experts.yml' --execute
tx config  mapping -r qubes.data_videos --source-lang en --type YAML_GENERIC --source-file _data/videos.yml --expression '_qubes-translated/<lang>/_data/<lang>/videos.yml' --execute
tx config  mapping -r qubes.data_partners --source-lang en --type YAML_GENERIC --source-file _data/partners.yml --expression '_qubes-translated/<lang>/_data/<lang>/partners.yml' --execute
tx config  mapping -r qubes.data_download --source-lang en --type YAML_GENERIC --source-file _data/download.yml --expression '_qubes-translated/<lang>/_data/<lang>/download.yml' --execute
tx config  mapping -r qubes.data_intro --source-lang en --type YAML_GENERIC --source-file _data/intro.yml --expression '_qubes-translated/<lang>/_data/<lang>/intro.yml' --execute
tx config  mapping -r qubes.data_hcl --source-lang en --type YAML_GENERIC --source-file _data/hcl.yml --expression '_qubes-translated/<lang>/_data/<lang>/hcl.yml' --execute
tx config  mapping -r qubes.data_style_guide_content --source-lang en --type YAML_GENERIC --source-file _data/style_guide_content.yml --expression '_qubes-translated/<lang>/_data/<lang>/style_guide_content.yml' --execute
crudini --del .tx/config qubes._doc_en__doc_README
crudini --del .tx/config qubes._doc_en__doc_CONTRIBUTING
sed -i 's/_doc_en__doc/doc_/g' .tx/config

