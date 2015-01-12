require 'rails_helper'

RSpec.describe "ad_campaigns/show", :type => :view do
  before(:each) do
    @ad_campaign = assign(:ad_campaign, AdCampaign.create!(
      :campaign_title => "Campaign Title",
      :slug => "Slug",
      :merchant_info_url => "Merchant Info Url",
      :campaign_reach => "Campaign Reach",
      :campaign_plays => 1,
      :clickthru => 2,
      :campaign_price => 1.5,
      :merchant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Campaign Title/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Merchant Info Url/)
    expect(rendered).to match(/Campaign Reach/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
