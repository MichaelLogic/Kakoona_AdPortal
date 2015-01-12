require 'rails_helper'

RSpec.describe "AdCampaigns", :type => :request do
  describe "GET /ad_campaigns" do
    it "works! (now write some real specs)" do
      get ad_campaigns_path
      expect(response).to have_http_status(200)
    end
  end
end
