# frozen_string_literal: true
require_relative 'spec_helper'

RSpec.describe SocialMediaSystem::RetrieverService do
  let(:fb_handler) do 
    SocialMediaSystem::Facebook.new
  end
  let(:twitter_handler) do
  	SocialMediaSystem::Twitter.new
  end
  let(:fb_retriever) do
  	SocialMediaSystem::RetrieverService.new(fb_handler)
  end
  let(:twitter_retriever) do
  	SocialMediaSystem::RetrieverService.new(twitter_handler)
  end
  describe 'RetrieverService#retrieve' do
    it 'should return a thread' do
      expect(fb_retriever.retrieve).to be_instance_of(Thread)
      expect(twitter_retriever.retrieve).to be_instance_of(Thread)
    end
  end
end
