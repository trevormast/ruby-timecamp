require 'json'

module TimeCamp
  class Response
    def initialize(response)
      @response = response
    end

    def to_h
      return JSON.parse(@response.body)
    end
  end
end