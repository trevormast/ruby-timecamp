module TimeCamp
  class EntryCollection < ResourceCollection
    def initialize(response)
      @resources = response.map{|entry| Entry.new(entry) }
    end

    def find(entry_id)
      return @resources.select{ |entry| entry.id == entry_id }.try(:first)
    end

    def self.parse(response)
      return EntryCollection.new([]) if response.blank?
      return response.is_a?(Array) ? EntryCollection.new(response) : Entry.new(response)
    end

  end
end