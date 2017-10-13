module TimeCamp
  class EntryCollection < ResourceCollection
    def initialize(response)
      @resources = response.map{|entry| Entry.new(entry) }
    end
  end
end