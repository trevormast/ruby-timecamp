module TimeCamp
  class Resource

    def initialize(response)
      load_attributes(response.with_indifferent_access)
    end

    #################
    # CLASS METHODS #
    #################

    def self.resource_name
      return self.to_s.demodulize.pluralize.downcase
    end

    ####################
    # INSTANCE METHODS #
    ####################

    def attributes
      return Hash[instance_variables.map { |name| [name, instance_variable_get(name)] } ]
    end
  end
end