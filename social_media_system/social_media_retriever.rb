# frozen_string_literal: true

module SocialMediaSystem
  class SocialMediaRetriever
    class << self
      def run
        facebook = Facebook.new.retrieve(RetrieverService.new)
        twitter = Twitter.new.retrieve(RetrieverService.new)
        resolve_request(facebook)
        resolve_request(twitter)
        { facebook: facebook[:output], twitter: twitter[:output] }
      end

      private

      def resolve_request(thread)
        thread.join
      end
    end
  end
end
