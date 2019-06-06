#deposit pages

SITE=https://msu.msucommons-dev.org

DEPOSIT_PARENT=$(wp --path=/srv/www/commons/current/web/wp --url=$SITE post create --post_type=page --post_title='Deposits' --post_status=publish --porcelain)

wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add $DEPOSIT_PARENT _wp_page_template templates/deposits/deposit.php

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create --post_type=page --post_title='Download' --post_status=publish \
 --post_parent=$DEPOSIT_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create --post_type=page --post_title='Item' --post_status=publish \
 --post_parent=$DEPOSIT_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template templates/deposits/deposit.php

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create --post_type=page --post_title='List' --post_status=publish \
 --post_parent=$DEPOSIT_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create deposits-offline.html --post_type=page --post_title='Offline' --post_status=publish \
 --post_parent=$DEPOSIT_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create deposits-removed.html --post_type=page --post_title='Removed' --post_status=publish \
 --post_parent=$DEPOSIT_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

wp --path=/srv/www/commons/current/web/wp --url=$SITE post create --post_type=page --post_title='View' --post_status=publish \
 --post_parent=$DEPOSIT_PARENT --porcelain | xargs -I % wp --path=/srv/www/commons/current/web/wp --url=$SITE post meta add % _wp_page_template default

