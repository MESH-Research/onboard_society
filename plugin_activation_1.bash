SITE=https://msu.msucommons-dev.org

for plugin in bbpress bbp-live-preview bp-blog-avatar bp-groupblog bp-group-documents bp-lotsa-feeds bp-mpo-activity-filter bp-block-member buddypress-docs buddypress-docs-minor-edit buddypress-followers commons-in-a-box more-privacy-options; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin --network; \
done

for plugin in humanities-commons hc-styles mla-academic-interests; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin --network; \
done

for plugin in 15zine-functionality akismet black-studio-tinymce-widget disable-password-reset-extended google-analytics-async multisite-plugin-manager redis-cache sparkpost sparkpost-bp-mailer so-widgets-bundle wp-accessibility wp-fail2ban; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin --network; \
done

