require 'rails_helper'

RSpec.describe "campaign_preload_grffks/index", :type => :view do
  before(:each) do
    assign(:campaign_preload_grffks, [
      CampaignPreloadGrffk.create!(
        :ad_campaign => nil,
        :raw_file_name => "Raw File Name",
        :meta_description => "Meta Description",
        :file_type => "File Type",
        :grffk_url => "Grffk Url"
      ),
      CampaignPreloadGrffk.create!(
        :ad_campaign => nil,
        :raw_file_name => "Raw File Name",
        :meta_description => "Meta Description",
        :file_type => "File Type",
        :grffk_url => "Grffk Url"
      )
    ])
  end

  it "renders a list of campaign_preload_grffks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Raw File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Meta Description".to_s, :count => 2
    assert_select "tr>td", :text => "File Type".to_s, :count => 2
    assert_select "tr>td", :text => "Grffk Url".to_s, :count => 2
  end
end
