module TimeCamp
  class ResourceCollection
    def initialize(response)
      @resources = []
    end

    def size
      return @resources.size
    end

    def [](index)
      return @resources[index]
    end

    def each(&block)
      return @resources.each(&block)
    end
  end
end