SITE=https://sah.hcommons.org

for plugin in bp-blog-avatar bp-groupblog bp-group-documents bp-lotsa-feeds bp-mpo-activity-filter bp-block-member buddypress-docs buddypress-docs-minor-edit buddypress-followers commons-in-a-box more-privacy-options; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin --network; \
done

for plugin in humanities-commons hc-styles mla-academic-interests; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin --network; \
done

for plugin in 15zine-functionality akismet black-studio-tinymce-widget disable-password-reset-extended event-organiser bp-event-organiser google-analytics-async multisite-plugin-manager redis-cache wordpress-sparkpost sparkpost-bp-mailer so-widgets-bundle wp-accessibility wp-fail2ban; do \
 wp --path=/srv/www/commons/current/web/wp --url=$SITE plugin activate $plugin --network; \
done

