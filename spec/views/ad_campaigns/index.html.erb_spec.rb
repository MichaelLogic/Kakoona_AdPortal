require 'rails_helper'

RSpec.describe "ad_campaigns/index", :type => :view do
  before(:each) do
    assign(:ad_campaigns, [
      AdCampaign.create!(
        :campaign_title => "Campaign Title",
        :slug => "Slug",
        :merchant_info_url => "Merchant Info Url",
        :campaign_reach => "Campaign Reach",
        :campaign_plays => 1,
        :clickthru => 2,
        :campaign_price => 1.5,
        :merchant => nil
      ),
      AdCampaign.create!(
        :campaign_title => "Campaign Title",
        :slug => "Slug",
        :merchant_info_url => "Merchant Info Url",
        :campaign_reach => "Campaign Reach",
        :campaign_plays => 1,
        :clickthru => 2,
        :campaign_price => 1.5,
        :merchant => nil
      )
    ])
  end

  it "renders a list of ad_campaigns" do
    render
    assert_select "tr>td", :text => "Campaign Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Info Url".to_s, :count => 2
    assert_select "tr>td", :text => "Campaign Reach".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
