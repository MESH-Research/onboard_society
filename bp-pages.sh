#missing buddypress pages

SITE=up.hcommons.org

#Activate
#Members
#Register
#Activity

wp --url=$SITE post create --post_type=page --post_title='Groups' --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template default

wp --url=$SITE post create --post_type=page --post_title='Sites' --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template default

