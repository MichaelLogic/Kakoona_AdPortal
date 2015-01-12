require 'rails_helper'

RSpec.describe "MerchRepresentatives", :type => :request do
  describe "GET /merch_representatives" do
    it "works! (now write some real specs)" do
      get merch_representatives_path
      expect(response).to have_http_status(200)
    end
  end
end
