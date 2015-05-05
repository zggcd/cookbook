#
# Cookbook Name:: prometheus
# Recipe:: cms
#
# Copyright 2015, SpiralWorks
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"
include_recipe "hhvm"
include_recipe "php5-fpm::install"

package 'memcached' do
        action :install
end

directory '/opt/cms' do
        owner 'www-data'
        group 'www-data'
        mode '0755'
        action :create
end

directory '/var/log/nginx/cms' do
        owner 'www-data'
        group 'www-data'
        mode '0755'
        action :create
end

template '/opt/cms/test.php' do
	source 'test.php.erb'
	mode '755'
	owner 'www-data'
	group 'www-data'
end

link '/var/www/cms' do
	to '/opt/cms'
	link_type :symbolic
	action :create
end

template '/etc/nginx/sites-available/cms' do
	source 'cms.erb'
	mode '755'
	owner 'www-data'
	group 'www-data'
end

link '/etc/nginx/sites-enabled/cms' do
	to '/etc/nginx/sites-available/cms'
	link_type :symbolic
	action :create
end

link '/etc/nginx/sites-enabled/default' do
        action :delete
end

service 'nginx' do
	action :restart
end
