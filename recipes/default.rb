#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright (C) 2015 Sam Soffes
#

group 'admin' do
end

user 'soffes' do
  group 'admin'
  shell '/bin/bash'
end
