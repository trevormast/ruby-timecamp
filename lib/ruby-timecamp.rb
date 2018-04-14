# require everything in lib
Dir["./lib/ruby-timecamp/*.rb"].each {|file| require file }
Dir["./lib/ruby-timecamp/resources/*.rb"].each {|file| require file }
require 'active_support/all'
require 'rest-client'

module TimeCamp
  autoload :Request,              'ruby-timecamp/request'
  autoload :Resource,             'ruby-timecamp/resource'
  autoload :ResourceCollection,   'ruby-timecamp/resource_collection'
  autoload :Response,             'ruby-timecamp/response'

  autoload :Entry,                'ruby-timecamp/resources/entry'
  autoload :EntryCollection,      'ruby-timecamp/resources/entry_collection'
  autoload :Task,                 'ruby-timecamp/resources/task'
  autoload :TaskCollection,       'ruby-timecamp/resources/task_collection'
  autoload :Timer,                'ruby-timecamp/resources/timer'
  autoload :User,                 'ruby-timecamp/resources/user'
  autoload :UserCollection,       'ruby-timecamp/user_collection'
end