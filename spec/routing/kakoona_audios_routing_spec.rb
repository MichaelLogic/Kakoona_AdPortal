require "rails_helper"

RSpec.describe KakoonaAudiosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/kakoona_audios").to route_to("kakoona_audios#index")
    end

    it "routes to #new" do
      expect(:get => "/kakoona_audios/new").to route_to("kakoona_audios#new")
    end

    it "routes to #show" do
      expect(:get => "/kakoona_audios/1").to route_to("kakoona_audios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/kakoona_audios/1/edit").to route_to("kakoona_audios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/kakoona_audios").to route_to("kakoona_audios#create")
    end

    it "routes to #update" do
      expect(:put => "/kakoona_audios/1").to route_to("kakoona_audios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/kakoona_audios/1").to route_to("kakoona_audios#destroy", :id => "1")
    end

  end
end
