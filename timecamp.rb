# require everything in lib
Dir["/lib/*.rb"].each {|file| require file }
require 'active_support/all'
require 'rest-client'

module TimeCamp
end