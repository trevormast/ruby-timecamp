module TimeCamp
  class Request
    BASE_URL = 'https://www.timecamp.com/third_party/api/'
    API_TOKEN = ENV['TIMECAMP_API_TOKEN']

    # RESTful METHODS
    def self.get(resource, opts={})
      # return instance of response
      return request('get', resource, opts)
    end

    def self.post(resource, opts={})
      # return instance of response
      return request('post', resource, opts)
    end

    def self.put(resource, opts={})
      # return instance of response
      return request('put', resource, opts)
    end

    def self.delete(resource, opts={})
      # return instance of response
      return request('delete', resource, opts)
    end

    private
      def self.url(resource, opts)
        return BASE_URL + "#{ resource }/format/json/api_token/#{ API_TOKEN }/" + opts.to_a.flatten.join('/')
      end

      def self.request(action, resource, opts)
        response = RestClient.send(action.to_sym, url(resource, opts), {})
        return TimeCamp::Response.new(response).to_h
      end
  end
end