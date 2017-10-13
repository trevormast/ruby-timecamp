module TimeCamp
  class Request
    BASE_URL = 'https://www.timecamp.com/third_party/api/'

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
      def self.url(resource, opts={})
        return BASE_URL + "#{ resource }/" + opts.to_a.flatten.join('/')
      end

      def self.request(action, resource, opts)
        response = RestClient.send(action.to_sym, url(resource, opts))
        return TimeCamp::Response.new(response)
      end
  end
end