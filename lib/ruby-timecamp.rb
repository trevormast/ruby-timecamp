# require everything in lib
Dir["./lib/ruby-timecamp/*.rb"].each {|file| require file }
Dir["./lib/ruby-timecamp/resources/*.rb"].each {|file| require file }
require 'active_support/all'
require 'rest-client'
