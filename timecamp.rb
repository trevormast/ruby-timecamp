# require everything in lib
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/resources/*.rb"].each {|file| require file }
require 'active_support/all'
require 'rest-client'
# dont require these for testing
unless (ENV['TIMECAMP_ENV'] == 'test')
  require 'httplog'
end
