module TimeCamp
  class Response
    def initialize(response)
      @response = JSON.parse(response.body)
      return @response
    end
  end
end