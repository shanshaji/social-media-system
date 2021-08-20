module SocialMediaSystem
  class RetrieverService
    def initialize(handler)
      @handler = handler
    end
    
    def retrieve
      Thread.new do
        Thread.current[:output] = retrieve_until_valid_response(@handler.url)
      end
    end

    private

    def retrieve_until_valid_response url
      res = Net::HTTP.get( URI.parse(url) )
      if valid_json?(res)
        return parse_json(res)
      else
        retrieve_until_valid_response(url)  unless valid_json?(res)
      end
    end

    def valid_json?(res)
      parse_json(res)  
        return true
      rescue JSON::ParserError => e
        return false
    end

    def parse_json(res)
      JSON.parse(res)
    end
  end
end
