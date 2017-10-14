module TimeCamp
  class EntryCollection < ResourceCollection
    def initialize(response)
      @resources = response.map{|entry| Entry.new(entry) }
    end

    def self.parse(response)
      return response.is_a?(Array) ? EntryCollection.new(response) : Entry.new(response)
    end
  end
end