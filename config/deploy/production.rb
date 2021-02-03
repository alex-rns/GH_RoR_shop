server "104.248.133.233", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "drum-shop"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "drum-shop.sytes.net"
set :puma_conf, "#{shared_path}/config/puma.rb"