##Onboard a new society

Initial

- Determine society id (XXX)
- Acquire wildcard ssl cert for society (XXX.hcommons.org)
- Create admin user and email user in hcommons.org mail system

COmanage server

- Add society logo in /var/www/humanities-commons/assets
- Add society specific index.php in /var/www/after_submission

COmanage

- Add COU
- Add Organization Identity Source
- Add Pipeline
- Add theme
- Add enrollment flows
- Add any managed groups
- Add any group mapping

Grouper

- Create Society folder under HCommons Root folder
- Add groups
- Add any composite groups necessary

COmanage

- Enroll society admin user in HC and add society role to user

HC Server

- Configure new Apache Virtual Host on HC server for subdomain (XXX)

IdMS stack

- Add AssertionConsumerService to shibboleth xml metadata and distribute to all systems.

InCommon

- Submit metadata update request

WordPress

- Add network in wp-admin

Mysql

- Add society id (XXX) to site meta
- Get new society root blog id
- Add siteurl to sitemeta, correct siteurl, home in wp_N_options
```sh
insert into wp_sitemeta (site_id,meta_key,meta_value) values ({new network}, 'society_id', '{society}');
select * from wp_blogs where site_id={new network};
update wp_sitemeta set meta_value='0' where site_id={new network} and meta_key='ms_files_rewriting';
update wp_{new_root_blog_id}_options set option_value='https://{society}.hcommons.org' where option_name='home';
update wp_{new_root_blog_id}_options set option_value='https://{society}.hcommons.org' where option_name='siteurl';
update wp_{new_root_blog_id}_options set option_value='' where option_name='upload_path';
```

HC Server

- Add variables to .env and config/environments/all.php
- - XXX_SITE_URL
- - XXX_ENROLLMENT_URL
- - XXX_ACCOUNT_LINK_URL
- - XXX_ROOT_BLOG_ID
- Add society id to the humanities-commons plugin bp member types and bp group types
- Add society id to the the groups auto populate function
- Add society id and description to get_cous in the comanage-api class

SparkPost

- configure sparkpost sending/reply/webhook (bp-reply-by-email) domains

WordPress

- Log in to HC WP network admin, then goto society id (XXX) WP network admin
- Activate shibboleth plugin
- Set options for shibboleth plugin
- Activate buddypress plugin
- Set options for buddypress plugin
- Activate all other network plugins
- Set all other options as necessary ( WP, BP )
- - set root blog storage quota to 5000MB
- - set sparkpost & reply-bp-email settings
- - discussion settings
- - WP default avatar
- - BP network settings - account deletion option
- Activate Theme
- Create XXX.css file for Boss-Child
- Activate root blog specific plugins (CORE)
- Ensure plugin manager options match existing networks
- - https://newnetwork.hcommons.org/wp-admin/network/plugins.php?page=plugin-management
- Set CORE settings Server Name
- Add all pages required for BP, CORE and membership handling not a member, we don't recognize you, about HC, accounts linked, logged out, societies
- Setup BP missing pages
- Define menu
- Add Home Page widgets
- Create Help and Support Site

That's all?

