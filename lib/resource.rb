module TimeCamp
  class Resource
    def self.resource_name
      return self.to_s.demodulize.pluralize.downcase
    end
  end
end