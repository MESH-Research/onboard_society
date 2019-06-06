SITE=https://msu.msucommons-dev.org

for plugin in autoptimize bp-attachment-xprofile-field-type bp-rbe-inbound-forum-attachments bp-rbe-new-topic buddypress-group-email-subscription buddypress-messages-spam-blocker bp-multiple-forum-post bp-reply-by-email buddypress-sitewide-activity-widget cac-featured-content elasticpress elasticpress-buddypress/elasticpress-buddypress gd-bbpress-attachments hc-custom  hc-notifications hc-suggestions humcore invite-anyone mashsharer mla-allowed-tags multisite-custom-css siteorigin-panels plugin-monitor typekit-fonts-for-wordpress wp-hide-dashboard wp-to-twitter; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin; \
done

