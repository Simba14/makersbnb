ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'server'

require_relative 'controllers/users'
require_relative './models/user'
