include_recipe 'nginx'

group 'web' do
  append true
  members ['nginx']
end

directory '/var/www' do
  owner 'web'
  group 'web'
  mode '0664'
end

attributes = {
  name: 'wwdchike',
  path: '/var/www/wwdchike.com',
  hosts: 'wwdchike.com *.wwdchike.com'
}

template "/etc/nginx/sites-available/#{attributes[:name]}.conf" do
  source 'ruby-app.conf'
  variables attributes
  notifies :reload, 'service[nginx]'
end

nginx_site "#{attributes[:name]}.conf" do
  action :enable
end
