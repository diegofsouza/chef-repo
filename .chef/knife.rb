# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dfurtado"
client_key               "#{current_dir}/dfurtado.pem"
validation_client_name   "ac-server-validator"
validation_key           "#{current_dir}/ac-server-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/ac-server"
cookbook_path            ["#{current_dir}/../cookbooks"]
