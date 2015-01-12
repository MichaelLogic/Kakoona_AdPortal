require "rails_helper"

RSpec.describe KakoonaVideosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/kakoona_videos").to route_to("kakoona_videos#index")
    end

    it "routes to #new" do
      expect(:get => "/kakoona_videos/new").to route_to("kakoona_videos#new")
    end

    it "routes to #show" do
      expect(:get => "/kakoona_videos/1").to route_to("kakoona_videos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/kakoona_videos/1/edit").to route_to("kakoona_videos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/kakoona_videos").to route_to("kakoona_videos#create")
    end

    it "routes to #update" do
      expect(:put => "/kakoona_videos/1").to route_to("kakoona_videos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/kakoona_videos/1").to route_to("kakoona_videos#destroy", :id => "1")
    end

  end
end
