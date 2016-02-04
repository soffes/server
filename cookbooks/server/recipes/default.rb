# Create user
include_recipe 'server::user'

# Nginx
include_recipe 'nginx::source'
service "nginx" do
  action :start
end

