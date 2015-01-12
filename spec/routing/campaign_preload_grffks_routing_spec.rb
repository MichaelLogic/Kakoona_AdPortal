require "rails_helper"

RSpec.describe CampaignPreloadGrffksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/campaign_preload_grffks").to route_to("campaign_preload_grffks#index")
    end

    it "routes to #new" do
      expect(:get => "/campaign_preload_grffks/new").to route_to("campaign_preload_grffks#new")
    end

    it "routes to #show" do
      expect(:get => "/campaign_preload_grffks/1").to route_to("campaign_preload_grffks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/campaign_preload_grffks/1/edit").to route_to("campaign_preload_grffks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/campaign_preload_grffks").to route_to("campaign_preload_grffks#create")
    end

    it "routes to #update" do
      expect(:put => "/campaign_preload_grffks/1").to route_to("campaign_preload_grffks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/campaign_preload_grffks/1").to route_to("campaign_preload_grffks#destroy", :id => "1")
    end

  end
end
