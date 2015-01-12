require 'rails_helper'

RSpec.describe "campaign_preload_grffks/show", :type => :view do
  before(:each) do
    @campaign_preload_grffk = assign(:campaign_preload_grffk, CampaignPreloadGrffk.create!(
      :ad_campaign => nil,
      :raw_file_name => "Raw File Name",
      :meta_description => "Meta Description",
      :file_type => "File Type",
      :grffk_url => "Grffk Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Raw File Name/)
    expect(rendered).to match(/Meta Description/)
    expect(rendered).to match(/File Type/)
    expect(rendered).to match(/Grffk Url/)
  end
end
