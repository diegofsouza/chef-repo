package 'httpd' do
  action :install
end

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end


execute 'mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled' do
  only_if do
    File.exists?('/etc/http/conf.d/welcome.conf')
  end
end

node['apache']['sites'].each do | site_name, site_data |
  document_root =  "/var/www/#{site_name}"
  
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source 'httpd.conf.erb'
    mode '0644'
    variables(:document_root => document_root, :port => site_data["port"])
    notifies :restart, 'service[httpd]'
  end

  directory document_root do
    mode '0755'
    recursive true
  end

  template "#{document_root}/index.html" do
    source 'index.html.erb'
    mode '0644'
    variables(:site_name => site_name, :port => site_data['port'])
  end

end
