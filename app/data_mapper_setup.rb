require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/space'
require_relative 'models/user'
require_relative 'models/request'
require_relative 'models/booking'

DataMapper.setup(:default, "postgres://localhost/four_m_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
