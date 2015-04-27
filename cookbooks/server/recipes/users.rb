user 'admin' do
  shell '/bin/bash'
end

group 'admin' do
  members ['admin']
end

group 'web' do
  append true
  members ['admin']
end

include_recipe 'sudo'

data_bag(:users).each do |key|
  user = data_bag_item(:users, key)
  username = user["username"]
  should_remove = user["remove"]
  homedir = "/home/#{username}"

  user_action = should_remove ? :remove : :create

  user username do
    uid user["uid"]
    home homedir
    gid "web"
    supports :manage_home => true
    shell "/bin/zsh"
    action user_action
  end

  unless should_remove
    group "admin" do
      members [username]
      append true
    end

    directory "#{homedir}/.ssh" do
      mode 0700
      owner username
    end

    template "#{homedir}/.ssh/authorized_keys" do
      mode 0600
      owner username
      variables :keys => user[:ssh_keys].map {|k| k[:public_key]}
    end
  end
end
