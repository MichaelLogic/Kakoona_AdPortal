require 'rails_helper'

RSpec.describe "CampaignPreloadGrffks", :type => :request do
  describe "GET /campaign_preload_grffks" do
    it "works! (now write some real specs)" do
      get campaign_preload_grffks_path
      expect(response).to have_http_status(200)
    end
  end
end
