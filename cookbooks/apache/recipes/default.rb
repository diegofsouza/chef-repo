package 'httpd' do
    action :install
end

service 'httpd' do
    action [:start, :enable]
end

cookbook_file '/var/www/html/index.html' do
    #source 'index.html'
    source node['apache']['index_file']
    mode '0644'
end


