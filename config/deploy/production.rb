server "104.248.19.68", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "drumshop"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "drumshop.sytes.net"
set :puma_conf, "#{shared_path}/config/puma.rb"