
# frozen_string_literal: true

require_relative 'social_media'
module SocialMediaSystem
	class Twitter < SocialMedia
		def initialize
			url = "https://takehome.io/twitter"
			super(url)
		end
		# def retrieve
  #   		retrieve_until_valid_response(@url)
  # 		end
	end
end