require "rails_helper"

RSpec.describe ContentProvidersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/content_providers").to route_to("content_providers#index")
    end

    it "routes to #new" do
      expect(:get => "/content_providers/new").to route_to("content_providers#new")
    end

    it "routes to #show" do
      expect(:get => "/content_providers/1").to route_to("content_providers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/content_providers/1/edit").to route_to("content_providers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/content_providers").to route_to("content_providers#create")
    end

    it "routes to #update" do
      expect(:put => "/content_providers/1").to route_to("content_providers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/content_providers/1").to route_to("content_providers#destroy", :id => "1")
    end

  end
end
