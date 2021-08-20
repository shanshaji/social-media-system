require 'rack/reloader'
require_relative 'social_media_system'

use Rack::Reloader
use Rack::Auth::Basic do |_username, password|
  password == 'password'
end
run SocialMediaSystem::App.new
