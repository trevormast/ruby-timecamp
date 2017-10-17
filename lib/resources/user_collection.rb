module TimeCamp
  class UserCollection < TimeCamp::ResourceCollection
    def initialize(response)
      @resources = response.map{|user| User.new(user) }
    end

    def self.parse(response)
      return (response.length > 1) ? UserCollection.new(response) : User.new(response[0])
    end
  end
end
