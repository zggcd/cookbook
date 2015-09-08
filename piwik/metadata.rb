maintainer       "gutefrage.net GmbH"
maintainer_email "matthias.marschall@gutefrage.net"
license          "Apache 2.0"
description      "Installs/Configures piwik"
version          "0.2.1"
name             "piwik"

recipe "piwik::default", "Installs and configures piwik"
recipe "piwik::master", "This recipe installs piwik on one host and let's you configure it by hitting /index.php. It will run archive.sh hourly on this host"
recipe "piwik::slave", "This recipe installs a piwik instance which connects as additional tracking server to an existing piwik instance (DB)"

depends "percona"
depends "spiral"
depends "iptables"
depends "logrotate"

attribute "piwik/version",
  :display_name => "Piwik Version",
  :description => "The piwik version to install",
  :default => "1.5.1"

attribute "piwik/install_path",
  :display_name => "Install Path",
  :description => "The path where the web server will expect the piwik dir to live",
  :default => "/var/www"

attribute "piwik/php_fcgi_memory_limit",
  :display_name => "FastCGI Memory Limit",
  :description => "The memory limit for PHP",
  :default => "128M"

attribute "piwik/php_fcgi_children",
  :display_name => "FastCGI Children",
  :description => "The number of concurrent PHP processes",
  :default => "5"

attribute "piwik/php_fcgi_max_requests",
  :display_name => "FastCGI Max Requests",
  :description => "Kill each PHP process after it served the given amount of requests to avoid memory bloat",
  :default => "1000"

attribute "piwik/php_fcgi_bind_path",
  :display_name => "FastCGI Bind Path",
  :description => "The URL or socket to let nginx talk to PHP (for fastcgi's config)",
  :default => "/tmp/.php-fcgi-socket"

attribute "piwik/php_fcgi_pass",
  :display_name => "FastCGI Pass Directive For nginx",
  :description => "The URL or socket to let nginx talk to PHP (for nginx's config)",
  :default => "unix:/tmp/.php-fcgi-socket"

attribute "piwik/config/superuser/login",
  :display_name => "Piwik Super User Login",
  :description => "The username of the piwik superuser",
  :default => "override_attribute in role!"

attribute "piwik/config/superuser/password",
  :display_name => "Piwik Super User Password",
  :description => "The MD5 hash of the password of the piwik superuser",
  :default => "override_attribute in role!"

attribute "piwik/config/superuser/email",
  :display_name => "Piwik Super User Email",
  :description => "The email address of the piwik superuser",
  :default => "override_attribute in role!"

attribute "piwik/config/superuser/salt",
  :display_name => "Piwik Super User Salt",
  :description => "The salt generated by piwik on installation",
  :default => "override_attribute in role!"

attribute "piwik/config/database/host",
  :display_name => "Piwik Database Host",
  :description => "The database server, where the piwik DB lives",
  :default => "localhost"

attribute "piwik/config/database/port",
  :display_name => "Piwik Database Port",
  :description => "The port of the database",
  :default => "3306"

attribute "piwik/config/database/username",
  :display_name => "Piwik Database Username",
  :description => "The username to connect to the database",
  :default => "piwik"

attribute "piwik/config/database/password",
  :display_name => "Piwik Database Password",
  :description => "The database password",
  :default => "override_attribute in role!"

attribute "piwik/config/database/dbname",
  :display_name => "Piwik Database Name",
  :description => "The name of the database with the existing piwik installation",
  :default => "piwik"

attribute "piwik/config/database/adapter",
  :display_name => "Piwik Database Adapter",
  :description => "The PHP database adapter to be used",
  :default => "PDO_MYSQL"

attribute "piwik/config/database/tables_prefix",
  :display_name => "Piwik Database Tables Prefix",
  :description => "The prefix of the existing piwik tables",
  :default => "piwik_"

attribute "piwik/config/database/charset",
  :display_name => "Piwik Database Charset",
  :description => "The charset of the existing piwik tables",
  :default => "utf8"

