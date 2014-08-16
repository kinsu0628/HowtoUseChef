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
