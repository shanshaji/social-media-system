# frozen_string_literal: true

require 'webmock/rspec'
require_relative './../social_media_system'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    body = File.open('./specs/support/fixtures/sample_response.json')
    stub_request(:get, /takehome/)
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'takehome.io',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: body, headers: {})
  end
end
