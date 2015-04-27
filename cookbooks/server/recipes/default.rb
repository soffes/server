#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright (C) 2015 Sam Soffes
#

include_recipe 'server::users'
include_recipe 'server::web'
