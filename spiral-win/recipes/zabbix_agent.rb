#
# Cookbook Name:: spiral-win
# Recipe:: zabbix_agent
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory 'C:\spiralworks' do
	inherits false
	rights :read, "Everyone"
	rights :write, "Administrators"
	rights :full_control, "Administrators", :applies_to_children => true
	action :create
	guard_interpreter :powershell_script
	not_if 'Test-Path C:\spiralworks'
end

remote_file 'c:\spiralworks\zabbix.zip' do
        source 'https://s3-ap-southeast-1.amazonaws.com/sw-ci-bucket/zabbix_agent'
        action :create
end

windows_zipfile 'c:/spiralworks' do
        source 'c:\spiralworks\zabbix.zip'
        action :unzip
        not_if {::File.exists?('c:\spiralworks\zabbix\zabbix_agentd.conf')}
end

execute 'service-zabbix' do
	guard_interpreter :powershell_script
	command 'c:\spiralworks\zabbix\zabbix_agentd.exe --config c:\spiralworks\zabbix\zabbix_agentd.conf --install'
	notifies :run, 'execute[service-zabbix]', :immediately
        not_if 'Get-Service | Where Name -eq "Zabbix Agent"'
end

execute 'service-zabbix' do
	command 'c:\spiralworks\zabbix\zabbix_agentd.exe --start'
	action :nothing
end

execute 'open-firewall' do
	command 'netsh advfirewall firewall add rule name="Zabbix Port" dir=in protocol=TCP localport=10050 action=allow'
	not_if 'Get-NetFirewallRule | Where DisplayName -eq "Zabbix Port"'
end
