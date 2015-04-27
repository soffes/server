package 'git'

user 'git'

group 'git' do
  append true
  members ['git']
end

all_keys = data_bag(:users).map { |u| data_bag_item(:users, u)["ssh_keys"] }.flatten.map {|ssh| ssh["public_key"]}
template "~/git/.ssh/authorized_keys" do
  mode 0600
  owner 'git'
  group 'git'
  variables :keys => all_keys
end

directory '/var/git' do
  owner 'git'
  group 'git'
  mode '0775'
end

node[:apps].each do |app|
  path = "/var/git/#{app[:name]}.git"
  execute 'Create git repo' do
    command "git init --bare #{path}"
    not_if { ::File.exists?(path) }
    group 'git'
    user 'git'
  end

  template "#{path}/hooks/post-update" do
    variables app
    owner 'git'
    group 'git'
    mode '0775'
  end
end
