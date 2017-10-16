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

    def map(&block)
      return @resources.map(&block)
    end

    def select(&block)
      return @resources.select(&block)
    end
  end
end