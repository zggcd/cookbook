include_recipe 'apt'

apt_repository 'newrelic' do
  uri 'http://apt.newrelic.com/debian'
  distribution 'newrelic' 
  components ['non-free']
  key 'https://download.newrelic.com/548C16BF.gpg'
end

package 'newrelic-sysmond'
