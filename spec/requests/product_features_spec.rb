require 'rails_helper'

RSpec.describe "ProductFeatures", type: :request do
  describe "GET /product_features" do
    it "works! (now write some real specs)" do
      get product_features_path
      expect(response).to have_http_status(200)
    end
  end
end
