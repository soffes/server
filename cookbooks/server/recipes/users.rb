group 'admin'

user 'soffes' do
  group 'admin'
  shell '/bin/bash'
end

include_recipe 'sudo'
