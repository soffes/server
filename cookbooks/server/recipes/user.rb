group node['server']['group']

user node['server']['user'] do
  group node['server']['group']
  system true
  shell '/bin/bash'
end
