module TimeCamp
  class User < TimeCamp::Resource
    attr_reader :user_id, :email, :login_count, :display_name,
                :synch_time, :login_time, :group_id

    def initialize(response)
      response.each { |k,v| instance_variable_set("@#{k.underscore}", v) }
    end

    def self.get
      response = TimeCamp::Request.get(resource_name)
      return UserCollection.parse(response)
    end
  end
end