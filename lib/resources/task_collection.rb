module TimeCamp
  class TaskCollection < TimeCamp::ResourceCollection
    def initialize(response)
      @resources = response.map{|task| Task.new(task) }
    end

    def self.parse(response)
      # TODO send correct argument to Task if only one task returned
      filtered_response = response.map{|k, v| v }
      return (response.length > 1) ? TaskCollection.new(filtered_response) : Task.new(filtered_response)
    end
  end
end