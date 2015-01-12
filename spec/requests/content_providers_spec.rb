require 'rails_helper'

RSpec.describe "ContentProviders", :type => :request do
  describe "GET /content_providers" do
    it "works! (now write some real specs)" do
      get content_providers_path
      expect(response).to have_http_status(200)
    end
  end
end
