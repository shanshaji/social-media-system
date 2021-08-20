# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe SocialMediaSystem::SocialMedia do
  let(:facebook) do
    SocialMediaSystem::Facebook.new
  end

  let(:twitter) do
    SocialMediaSystem::Twitter.new
  end

  let(:retriever) do
    SocialMediaSystem::RetrieverService.new
  end

  module SocialMediaSystem
    class Instagram < SocialMedia
      def initialize
        super("www.instagram.com")
      end
    end
  end

  let(:instagram) do
    SocialMediaSystem::Instagram.new
  end

  describe 'SocialMedia' do
    it 'should respond to retrieve' do
      expect(facebook).to respond_to(:retrieve)
      expect(twitter).to respond_to(:retrieve)
      expect(instagram).to respond_to(:retrieve)
    end
    context "If retrieve method is defined" do
      it "returns a thread" do
       expect(facebook.retrieve(retriever)).to be_instance_of(Thread)
       expect(twitter.retrieve(retriever)).to be_instance_of(Thread)
      end
    end
    context "If retrieve method is NOT defined" do
      it "returns an error" do
       expect{ instagram.retrieve }.to raise_error(SocialMediaSystem::Errors::RetrieveMethodNotFound)
      end
    end
  end
end
