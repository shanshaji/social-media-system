# frozen_string_literal: true
require_relative 'spec_helper'

RSpec.describe SocialMediaSystem::SocialMedia do
  let(:facebook) do 
    SocialMediaSystem::Facebook.new
  end

  let(:twitter) do
  	SocialMediaSystem::Twitter.new
  end

  describe 'SocialMedia' do
    it 'should have a url' do
      expect(facebook).to have_attributes(:url => "https://takehome.io/facebook")
      expect(twitter).to have_attributes(:url => "https://takehome.io/twitter")
    end
  end
end