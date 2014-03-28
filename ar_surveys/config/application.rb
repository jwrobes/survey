require 'pathname'
require 'sqlite3'
require 'active_record'
require 'logger'


APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

DB_PATH  = APP_ROOT.join('db', APP_NAME + ".db").to_s

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# Automatically load every file in APP_ROOT/app/models/*.rb, e.g.,
#   autoload "Person", 'app/models/person.rb'
#
# See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
# require 'pry'
# binding.pry #this opens pry with the code in the command line

#creates an array or files with the path app/ models / *.rb and loads them
#shorthand for require_relative all files in app ending in .rb
#fear the confilct between autoload (overrides errors and forces vs. require relative)
Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

require_relative "../app/controllers/surveycontroller"
require_relative "../app/view/surveyview.rb"

# Dir[APP_ROOT.join('app', 'view', '*.rb')].each do |model_file|
#   filename = File.basename(model_file).gsub('.rb', '')
#   autoload ActiveSupport::Inflector.camelize(filename), model_file
# end

# Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each do |model_file|
#   filename = File.basename(model_file).gsub('.rb', '')
#   autoload ActiveSupport::Inflector.camelize(filename), model_file
# end

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
