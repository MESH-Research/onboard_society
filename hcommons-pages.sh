#HCommons pages

SITE=up.hcommons.org

wp --url=$SITE post create --post_type=page --post_title='Societies' --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template page-content-only.php

echo "Add Societies content"

wp --url=$SITE post create hcommons-guidelines.html --post_type=page --post_title='Guidelines for Participation' --post_name=guidlines --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template page-content-only.php

wp --url=$SITE post create hcommons-privacy.html --post_type=page --post_title='Privacy Policy' --post_name=privacy --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template page-content-only.php

wp --url=$SITE post create hcommons-terms.html --post_type=page --post_title='Terms of Service' --post_name=terms --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template page-content-only.php

wp --url=$SITE post create --post_type=page --post_title='About' --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template default

echo "Add About content"

wp --url=$SITE post create hcommons-accounts-linked.html --post_type=page --post_title='Accounts Linked' --post_name=accounts-linked --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template default

wp --url=$SITE post create hcommons-inactive-member.html --post_type=page --post_title='Inactive Member!' --post_name=inactive-member --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template default

echo "Update Inactive Member content"

wp --url=$SITE post create hcommons-logged-out.html --post_type=page --post_title='Logged Out!' --post_name=logged-out --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template default

wp --url=$SITE post create --post_type=page --post_title='Not a Member' --post_name=not-a-member --post_status=publish \
 --porcelain | xargs -I % wp --url=$SITE post meta add % _wp_page_template not-a-member-template.php

echo "Add Not a Member content"

