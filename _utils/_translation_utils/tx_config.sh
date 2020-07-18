#!/bin/bash
# to be run from the git root
bash _utils/_translation_utils/extract_news_categories_html.sh news/categories/index.html aux/news_categories_strings.yml
bash _utils/_translation_utils/extract_news_html.sh news/index.html aux/news_strings.yml

tx config mapping-bulk -p qubes --source-language en  --type GITHUBMARKDOWN -f '.md' -d --source-file-dir _doc/en/_doc/ -i _dev --expression '_qubes-translated/<lang>/_doc/{filepath}/{filename}{extension}'   --execute
tx config mapping-bulk -p qubes --source-language en  --type HTML -f '.html' -d --source-file-dir _doc/en/_doc/ -i _dev --expression '_qubes-translated/<lang>/_doc/{filepath}/{filename}{extension}' --execute
tx config mapping-bulk -p qubes --source-language en --type GITHUBMARKDOWN -f '.md' -d --source-file-dir pages --expression '_qubes-translated/<lang>/pages/{filepath}/{filename}{extension}' --execute
tx config mapping-bulk -p qubes --source-language en --type GITHUBMARKDOWN -f '.md' -d --source-file-dir news --expression '_qubes-translated/<lang>/news/{filepath}/{filename}{extension}' --execute
tx config mapping-bulk -p qubes --source-language en --type HTML -f '.html' -d --source-file-dir pages --expression '_qubes-translated/<lang>/pages/{filepath}/{filename}{extension}' --execute
tx config mapping-bulk -p qubes --source-language en --type YAML_GENERIC -f '.yml' -d --source-file-dir aux --expression '_qubes-translated/<lang>/aux/{filepath}/{filename}{extension}' --execute
tx config  mapping -r qubes.data_architecture --source-lang en --type YAML_GENERIC --source-file _data/architecture.yml --expression '_qubes-translated/<lang>/_data/<lang>/architecture.yml' --execute
tx config  mapping -r qubes.data_index --source-lang en --type YAML_GENERIC --source-file _data/index.yml --expression '_qubes-translated/<lang>/_data/<lang>/index.yml' --execute
tx config  mapping -r qubes.data_teamtexts --source-lang en --type YAML_GENERIC --source-file _data/teamtexts.yml --expression '_qubes-translated/<lang>/_data/<lang>/teamtexts.yml' --execute
tx config  mapping -r qubes.data_home --source-lang en --type YAML_GENERIC --source-file _data/home.yml --expression '_qubes-translated/<lang>/_data/<lang>/home.yml' --execute
tx config  mapping -r qubes.data_sec_bulletins --source-lang en --type YAML_GENERIC --source-file _data/security_bulletins.yml --expression '_qubes-translated/<lang>/_data/<lang>/security_bulletins.yml' --execute
tx config  mapping -r qubes.data_sec_canaries --source-lang en --type YAML_GENERIC --source-file _data/security_canaries.yml --expression '_qubes-translated/<lang>/_data/<lang>/security_canaries.yml' --execute
tx config  mapping -r qubes.data_news --source-lang en --type YAML_GENERIC --source-file _data/news.yml --expression '_qubes-translated/<lang>/_data/<lang>/news.yml' --execute
tx config  mapping -r qubes.data_catnews --source-lang en --type YAML_GENERIC --source-file _data/catnews.yml --expression '_qubes-translated/<lang>/_data/<lang>/catnews.yml' --execute
crudini --del .tx/config qubes._doc_en__doc_README
crudini --del .tx/config qubes._doc_en__doc_CONTRIBUTING
sed -i 's/_doc_en__doc/doc_/g' .tx/config

