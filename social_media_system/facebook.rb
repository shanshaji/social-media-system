# frozen_string_literal: true

require_relative 'social_media'
module SocialMediaSystem
  class Facebook < SocialMedia
    def initialize
      super(Constants::FACEBOOK_URL)
    end

    def retrieve(retriever)
      retriever.retrieve(@url)
    end
  end
end
