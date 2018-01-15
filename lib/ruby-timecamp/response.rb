require 'json'

module TimeCamp
  class Response
    def initialize(response)
      @response = response
    end

    def to_h
      return @response.body.present? ? JSON.parse(@response.body) : @response.body
    end
  end
end