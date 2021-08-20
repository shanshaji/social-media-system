# frozen_string_literal: true

require_relative 'social_media'
module SocialMediaSystem
  class Twitter < SocialMedia
    def initialize
      super(Constants::TWITTER_URL)
    end

    def retrieve(retriever)
      retriever.retrieve(@url)
    end
  end
end
