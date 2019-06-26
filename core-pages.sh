#CORE pages

SITE=https://msu.hcommons-dev.org

CORE_PARENT=$(wp --path=/srv/www/commons/current/web/wp --url=$SITE post create core.html --post_type=page --post_title='Welcome to <em>CORE</em>!' --post_name=core --post_status=publish --porcelain)

echo "Update CORE content"

wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add $CORE_PARENT _wp_page_template templates/deposits/welcome.php

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create core-faq.html --post_type=page --post_title='<em>CORE</em> Frequently Asked Questions' --post_name=faq --post_status=publish \
 --post_parent=$CORE_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template templates/deposits/faq.php

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create core-acknowledgments.html --post_type=page --post_title='<em>CORE</em> Acknowledgments' --post_name=acknowledgments --post_status=publish \
 --post_parent=$CORE_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create core-terms.html --post_type=page --post_title='<em>CORE</em> Author Rights and Permissions' --post_name=terms --post_status=publish \
 --post_parent=$CORE_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template templates/deposits/acceptance.php

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create core-press.html --post_type=page \
 --post_title='The Modern Language Association and the Center for Digital Research and Scholarship Launch <em>CORE</em>' \
 --post_name=press-release --post_status=publish --post_parent=$CORE_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create core-about.html --post_type=page \
 --post_title='What is <em>CORE?</em>' \
 --post_name=what-is-core --post_status=publish --post_parent=$CORE_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

