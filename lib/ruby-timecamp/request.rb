module TimeCamp
  class Request
    BASE_URL = 'https://www.timecamp.com/third_party/api/'
    API_TOKEN = ENV['TIMECAMP_API_TOKEN']

    # RESTful METHODS
    def self.get(resource, opts={}, data={})
      # return instance of response
      return request(:get, resource, opts, data)
    end

    def self.post(resource, opts={}, data={})
      # return instance of response
      return request(:post, resource, opts, data)
    end

    def self.put(resource, opts={}, data={})
      # return instance of response
      return request(:put, resource, opts, data)
    end

    def self.delete(resource, opts={}, data={})
      # return instance of response
      return request(:delete, resource, opts, data)
    end

    private
      def self.url(resource, opts)
        return BASE_URL + "#{ resource }/format/json/api_token/#{ API_TOKEN }/" + opts.to_a.flatten.join('/')
      end

      def self.request(action, resource, opts, data={})
        # response = RestClient.send(action.to_sym, url(resource, opts), data)
        response = RestClient::Request.execute(method: action.to_sym, url: url(resource, opts), payload: data)
        return TimeCamp::Response.new(response).to_h
      end
  end
end