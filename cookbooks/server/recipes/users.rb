user 'soffes' do
  shell '/bin/bash'
end

user 'web'

group 'admin' do
  members ['soffes']
end

group 'web' do
  members ['soffes', 'web']
end

include_recipe 'sudo'
