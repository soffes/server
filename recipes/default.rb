#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'server::git'
include_recipe 'server::users'
include_recipe 'server::ruby'
include_recipe 'server::redis'
include_recipe 'server::web'
