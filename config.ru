# frozen_string_literal: true
#\ -p 3000
require 'rack/reloader'
require_relative 'social_media_system'

use Rack::Reloader
run SocialMediaSystem::App.new
