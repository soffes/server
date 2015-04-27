include_recipe 'nginx'

user 'web'

group 'web' do
  append true
  members ['web', 'nginx']
end

directory '/var/www' do
  owner 'web'
  group 'web'
  mode '0775'
end

node[:apps].each do |app|
  template "/etc/nginx/sites-available/#{app[:name]}" do
    source 'ruby-app.conf'
    variables app
    notifies :reload, 'service[nginx]'
  end

  nginx_site app[:name] do
    action :enable
  end
end
