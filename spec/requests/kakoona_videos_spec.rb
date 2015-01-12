require 'rails_helper'

RSpec.describe "KakoonaVideos", :type => :request do
  describe "GET /kakoona_videos" do
    it "works! (now write some real specs)" do
      get kakoona_videos_path
      expect(response).to have_http_status(200)
    end
  end
end
