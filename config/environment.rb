ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require './app/controllers/listings_controller'
require './app/controllers/users_controller'
require_all 'app'

Paperclip.options[:command_path] = "/usr/local/bin/"

