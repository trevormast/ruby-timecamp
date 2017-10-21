module TimeCamp
  class TaskCollection < TimeCamp::ResourceCollection
    def initialize(response)
      filtered_response = response.map{|k, v| v }
      @resources = filtered_response.map{|task| Task.new(task) }
    end

    def self.parse(response)
      return TimeCamp::TaskCollection.collection?(response) ? TaskCollection.new(response) : Task.new(response)
    end


    def self.collection?(response)
      # return true if the response is an array
      # or if all of the keys are strings of digits only
      return response.is_a?(Array) || response.keys.all?{ |key| key.scan(/\D/).blank? }
    end
  end
end