#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log " start " 
package "vim-enhanced" do
		action :install
end

#serviceのリソースを利用する
#ファイアウォールを消す service iptables stop
service "iptables" do
	action [:stop, :disable]
end

#php mysql-server httpd
%w{php mysql-server httpd}.each do |p|
	package p do
		action :install
	end
end

service "httpd" do
	action [:start, :enable]
end

#TOPページを作る
template "index.html" do
	path "/var/www/html/index.html"
	source "index.html.erb"
	mode 0644
end