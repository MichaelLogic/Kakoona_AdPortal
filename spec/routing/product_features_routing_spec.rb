require "rails_helper"

RSpec.describe ProductFeaturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/product_features").to route_to("product_features#index")
    end

    it "routes to #new" do
      expect(:get => "/product_features/new").to route_to("product_features#new")
    end

    it "routes to #show" do
      expect(:get => "/product_features/1").to route_to("product_features#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_features/1/edit").to route_to("product_features#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/product_features").to route_to("product_features#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_features/1").to route_to("product_features#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_features/1").to route_to("product_features#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_features/1").to route_to("product_features#destroy", :id => "1")
    end

  end
end
