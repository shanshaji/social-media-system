# frozen_string_literal: true

require 'json'
require 'net/http'
Dir["#{File.dirname(__FILE__)}/social_media_system/**/*.rb"].sort.each { |file| require file }

module SocialMediaSystem
  # Opens up api end point.
  class App
    def call(env)
      request = Rack::Request.new(env)
      case request.path
      when '/'
        resp = retrieve_social_media_posts(request)
        resp.finish
      else
        not_found
      end
    end

    def retrieve_social_media_posts(request)
      if request.get?
        json_response(SocialMediaSystem::SocialMediaRetriever.run)
      else
        not_found
      end
    rescue StandardError => e
      Rack::Response.new(e.message, 422)
    end

    def not_found
      Rack::Response.new(['NOT FOUND'], 404)
    end

    def json_response(resp)
      Rack::Response.new(
        resp.to_json, 200,
        'Content-Type' => 'application/json'
      )
    end
  end
end
