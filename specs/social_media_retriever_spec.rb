# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe SocialMediaSystem::SocialMediaRetriever do
  let(:social_media_posts) do
    SocialMediaSystem::SocialMediaRetriever.run
  end

  describe 'SocialMediaRetriever' do
    it 'returns a Hash' do
      expect(social_media_posts.is_a?(Hash)).to be_truthy
      expect(social_media_posts).to have_key(:facebook)
      expect(social_media_posts).to have_key(:twitter)
    end

    it 'retrieves post from facebook' do
      expect(social_media_posts).to include(:facebook)
      expect(social_media_posts).to include(match(/facebook/) => a_kind_of(Array))
    end

    it 'retrieves tweets from twitter' do
      expect(social_media_posts).to include(:twitter)
      expect(social_media_posts).to include(match(/twitter/) => a_kind_of(Array))
    end
  end
end
