require "rails_helper"

RSpec.describe AdCampaignsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ad_campaigns").to route_to("ad_campaigns#index")
    end

    it "routes to #new" do
      expect(:get => "/ad_campaigns/new").to route_to("ad_campaigns#new")
    end

    it "routes to #show" do
      expect(:get => "/ad_campaigns/1").to route_to("ad_campaigns#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ad_campaigns/1/edit").to route_to("ad_campaigns#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ad_campaigns").to route_to("ad_campaigns#create")
    end

    it "routes to #update" do
      expect(:put => "/ad_campaigns/1").to route_to("ad_campaigns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ad_campaigns/1").to route_to("ad_campaigns#destroy", :id => "1")
    end

  end
end
