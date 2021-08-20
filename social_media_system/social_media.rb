# frozen_string_literal: true

module SocialMediaSystem
  class SocialMedia
    def initialize(url)
      @url = url
    end

    def retrieve(_retriever = nil)
      raise Errors::RetrieveMethodNotFound
    end
  end
end
