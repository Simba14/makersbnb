ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'

require_relative 'controllers/users'
require_relative 'controllers/space'
require_relative 'controllers/sessions'
require_relative 'controllers/requests'

require_relative './models/user'
require_relative './models/space'
require_relative './models/request'
