require 'rails_helper'

RSpec.describe "KakoonaAudios", :type => :request do
  describe "GET /kakoona_audios" do
    it "works! (now write some real specs)" do
      get kakoona_audios_path
      expect(response).to have_http_status(200)
    end
  end
end
