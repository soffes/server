include_recipe 'redis'

# ruby_block "add REDIS_URL environment variable" do
#   block do
#     host = node[:redis][:host]
#     port = node[:redis][:port]
#     db = node[:redis][:db]
#     redis_url = "redis://#{host}:#{port}/#{db}"
#     file = Chef::Util::FileEdit.new("/etc/environment")
#     file.search_file_replace_line(/REDIS_URL/, "REDIS_URL=#{redis_url}")
#     file.insert_line_if_no_match(/REDIS_URL/, "REDIS_URL=#{redis_url}")
#     file.write_file
#   end
# end
