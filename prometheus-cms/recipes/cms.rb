include_recipe "nginx"
include_recipe "hhvm"

package 'memcached' do
        action :install
end

template '~/cms/test.php' do
	source 'test.php.erb'
	mode '644'
	owner 'www-data'
	group 'www-data'
end

link "~/cms" do
  to "/var/www/html/cms"
end
