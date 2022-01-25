##Onboard a new society

#TODO network activate classic-editor, set network settings
#TODO add fixing themes/boss-child/buddypress/members/single/settings/general.php
#TODO add fixing mu-plugins/hc-footer.php
#TODO add_filter( 'ep_post_sync_kill', 'hcommons_filter_ep_post_sync_kill', 10, 3 );
#TODO hc-custom/includes/elasticpress-buddypress.php
#TODO // Hide some networks & post types from search facets.
#TODO add_filter( 'ep_bp_show_network_facet_8', '__return_false' ); // ARLIS.
#TODO clear extra widgets from default sidebar
#TODO after page creation - Add About content
#TODO after page creation - Update Inactive Member content
#TODO add society id to scripts in dev-scripts (prod, dev, etc.)
#TODO update config/environments/all.php with constants
#TODO autooptmize should be off for css and js

Initial

- Determine society id (XXX)
- Acquire wildcard ssl cert for society (XXX.hcommons.org, \*.XXX.hcommons.org) now handled in AWS
- Create email user in hcommons.org mail system (XXX.hcommons.org)
- Create admin user in hcommons.org (XXXadmin)

COmanage server

- Add society logos in /var/www/img/ (XXX_55.png)
- Add society specific index.php in /var/www/after_submission
- Add society specific css to /var/www/humanities_commons/assets/global.css (XXX enrollment styles) #TODO CAN THIS BE REMOVED?
- Add society specific theme css to /var/www/humanities_commons/assets/XXX.css #TODO CAN THIS BE REMOVED?
- Add society specific membership as file to ~/comanage-batch if necessary for testing

COmanage

- Add COU
- Add Pipeline
- Add Organization Identity Source (flat file for testing)
- Add theme
- Add enrollment flows
- Add any managed groups
- Add any group mapping
- Add Enrollment Flow ID / COU mapping to /var/www/comanage-registry/local/Plugin/HCConfirmer/Controller/HCConfirmersController.php

Grouper

#- Create Society folder under HCommons Root folder
- Create Society folder under ForExport Hcommons folder
- Add admin_XXX and members_XXX groups
- Add HCommons Root XXX CO_COU_XXX_admin and CO_COU_XXX_members_active to ForExport XXX admin_XXX and members_XXX
- Add any groups necessary
- Add any composite groups necessary

COmanage

- Enroll society admin user in HC and add society role to user

HC Server

#- Configure new Apache Virtual Host on HC server for subdomain (XXX)

IdMS stack

# Add AssertionConsumerService to shibboleth xml metadata and distribute to all systems (if domain mapping to be implemented).
- Add COU to satosa /opt/satosa/plugins/src/process_group_memberships.py 
#InCommon

#- Submit metadata update request

WordPress

- Add network in wp-admin

Mysql

- Add society id (XXX) to site meta
- Get new society root blog id
```sh
insert into wp_sitemeta (site_id,meta_key,meta_value) values ({new network}, 'society_id', '{society}');
update wp_sitemeta set meta_value='0' where site_id={new network} and meta_key='ms_files_rewriting';
select * from wp_blogs where site_id={new network};
update wp_{new_root_blog_id}_options set option_value='https://{society}.hcommons.org' where option_name='home';
update wp_{new_root_blog_id}_options set option_value='https://{society}.hcommons.org' where option_name='siteurl';
update wp_{new_root_blog_id}_options set option_value='' where option_name='upload_path';
```

HC Server

- Add variables to .env and config/environments/all.php
#- - XXX_SITE_URL
- - XXX_ENROLLMENT_URL
- - XXX_ACCOUNT_LINK_URL
- - XXX_ROOT_BLOG_ID
- Add society id to the humanities-commons plugin bp member types and bp group types
- Add society id to the the groups auto populate function
- Add society id and description to get_cous in the comanage-api class

#Login to XXX doesn't work at this point, activate shibboleth using cli, configure using mysql
wp --path=/srv/www/commons/current/web/wp --url=XXX.hcommons-dev.org plugin activate shibboleth --network

SparkPost
#when?
- configure sparkpost sending/reply/webhook (bp-reply-by-email) domains

Mysql

update shibboleth settings in mysql
```
update wp_sitemeta set meta_value=1 where meta_key='shibboleth_default_login' and site_id={new network};
update wp_sitemeta set meta_value=1 where meta_key='shibboleth_auto_login' and site_id={new network};
update wp_sitemeta set meta_value='http://msu.hcommons-dev.org/Shibboleth.sso/Logout?return=https://msu.hcommons-dev.org/logged-out/' where meta_key='shibboleth_logout_url' and site_id={new network};

update wp_sitemeta set meta_value='a:6:{s:8:"username";a:1:{s:4:"name";s:19:"HTTP_EMPLOYEENUMBER";}s:10:"first_name";a:1:{s:4:"name";s:14:"HTTP_GIVENNAME";}s:9:"last_name";a:1:{s:4:"name";s:7:"HTTP_SN";}s:8:"nickname";a:2:{s:4:"name";s:19:"HTTP_EMPLOYEENUMBER";s:7:"managed";s:2:"on";}s:12:"display_name";a:1:{s:4:"name";s:16:"HTTP_DISPLAYNAME";}s:5:"email";a:1:{s:4:"name";s:9:"HTTP_MAIL";}}' where meta_key='shibboleth_headers' and site_id={new network};

update wp_sitemeta set meta_value='a:11:{s:13:"administrator";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:6:"author";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:7:"default";s:10:"subscriber";s:6:"editor";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:11:"contributor";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:10:"subscriber";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:13:"bbp_keymaster";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:13:"bbp_spectator";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:11:"bbp_blocked";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:13:"bbp_moderator";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}s:15:"bbp_participant";a:2:{s:6:"header";s:0:"";s:5:"value";s:0:"";}}' where meta_key='shibboleth_roles' and site_id={new network};
```

WordPress

- Log in to (XXX) WP network admin
#- Log in to HC WP network admin, then goto society id (XXX) WP network admin
#- Activate shibboleth plugin
#- Set options for shibboleth plugin
- Activate buddypress plugin
- Set options for buddypress plugin
- Set network and network plugin options as necessary ( WP, BP )
- Activate all other network plugins
- Activate root blog specific plugins (CORE, etc.)
- Set all other options as necessary ( WP, BP )
- - set root blog storage quota to 5000MB
- - set sparkpost & reply-bp-email settings
- - discussion settings (create XXX Group Forums root level discussion forum)
- - WP default avatar
- - BP network settings - account deletion option
- Activate Theme
- Create XXX.css file for Boss-Child
- Ensure plugin manager options match existing networks
- - https://newnetwork.hcommons.org/wp-admin/network/plugins.php?page=plugin-management
- Set CORE settings Server Name
- Add all pages required for BP, CORE and membership handling not a member, we don't recognize you, about HC, accounts linked, logged out, societies
- Setup BP missing pages
- Define menu
- Add Home Page widgets
- Create Help and Support Site

That's all?

