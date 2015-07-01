package 'httpd' do
    action :install
end

service 'httpd' do
    action [:start, :enable]
end

cookbook_file '/var/www/html/index.html' do
    source 'index.html'
    mode '0644'
end


