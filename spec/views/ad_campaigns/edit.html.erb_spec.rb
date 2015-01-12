require 'rails_helper'

RSpec.describe "ad_campaigns/edit", :type => :view do
  before(:each) do
    @ad_campaign = assign(:ad_campaign, AdCampaign.create!(
      :campaign_title => "MyString",
      :slug => "MyString",
      :merchant_info_url => "MyString",
      :campaign_reach => "MyString",
      :campaign_plays => 1,
      :clickthru => 1,
      :campaign_price => 1.5,
      :merchant => nil
    ))
  end

  it "renders the edit ad_campaign form" do
    render

    assert_select "form[action=?][method=?]", ad_campaign_path(@ad_campaign), "post" do

      assert_select "input#ad_campaign_campaign_title[name=?]", "ad_campaign[campaign_title]"

      assert_select "input#ad_campaign_slug[name=?]", "ad_campaign[slug]"

      assert_select "input#ad_campaign_merchant_info_url[name=?]", "ad_campaign[merchant_info_url]"

      assert_select "input#ad_campaign_campaign_reach[name=?]", "ad_campaign[campaign_reach]"

      assert_select "input#ad_campaign_campaign_plays[name=?]", "ad_campaign[campaign_plays]"

      assert_select "input#ad_campaign_clickthru[name=?]", "ad_campaign[clickthru]"

      assert_select "input#ad_campaign_campaign_price[name=?]", "ad_campaign[campaign_price]"

      assert_select "input#ad_campaign_merchant_id[name=?]", "ad_campaign[merchant_id]"
    end
  end
end
