# frozen_string_literal: true

module SocialMediaSystem
  class RetrieverService
    MAX_RETRY_COUNT = 10

    def retrieve(url)
      Thread.new do
        Thread.current[:output] = retrieve_until_valid_response(url)
      end
    end

    private

    def retrieve_until_valid_response(url, count = 0)
      res = Net::HTTP.get(URI.parse(url))
      if valid_json?(res)
        parse_json(res)
      else
        raise Errors::SystemDown if is_system_down?(count)

        retrieve_until_valid_response(url, count + 1)
      end
    rescue StandardError => e
      count += 1
      raise Errors::SystemDown if is_system_down?(count)

      retry
    end

    def valid_json?(res)
      parse_json(res)
      true
    rescue JSON::ParserError => e
      false
    end

    def parse_json(res)
      JSON.parse(res)
    end

    def is_system_down?(count)
      count > MAX_RETRY_COUNT
    end
  end
end
