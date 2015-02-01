require 'open3'
require 'json'
require 'active_record'
require 'sqlite3'

class Assigned < ActiveRecord::Base
end

ActiveRecord::Base.logger = Logger.new('debug.log')
ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(:development)

