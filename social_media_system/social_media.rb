# frozen_string_literal: true

module SocialMediaSystem
	class SocialMedia
		attr_reader :url
		def initialize(url)
			@url = url
		end
		# def retrieve
  #   		raise 'Must implement!'
  # 		end

  # 		private

  # 		def retrieve_until_valid_response url
  # 			res = Net::HTTP.get( URI.parse(url) )
  # 			if valid_json?(res)
  # 				return JSON.parse(res)
  # 			else
  # 				retrieve_until_valid_response(url)	unless valid_json?(res)
  # 			end
  # 		end

		# def valid_json?(res)
		#     JSON.parse(res)
		#     return true
		#   rescue JSON::ParserError => e
		#     return false
		# end
	end
end