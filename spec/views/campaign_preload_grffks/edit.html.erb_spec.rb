require 'rails_helper'

RSpec.describe "campaign_preload_grffks/edit", :type => :view do
  before(:each) do
    @campaign_preload_grffk = assign(:campaign_preload_grffk, CampaignPreloadGrffk.create!(
      :ad_campaign => nil,
      :raw_file_name => "MyString",
      :meta_description => "MyString",
      :file_type => "MyString",
      :grffk_url => "MyString"
    ))
  end

  it "renders the edit campaign_preload_grffk form" do
    render

    assert_select "form[action=?][method=?]", campaign_preload_grffk_path(@campaign_preload_grffk), "post" do

      assert_select "input#campaign_preload_grffk_ad_campaign_id[name=?]", "campaign_preload_grffk[ad_campaign_id]"

      assert_select "input#campaign_preload_grffk_raw_file_name[name=?]", "campaign_preload_grffk[raw_file_name]"

      assert_select "input#campaign_preload_grffk_meta_description[name=?]", "campaign_preload_grffk[meta_description]"

      assert_select "input#campaign_preload_grffk_file_type[name=?]", "campaign_preload_grffk[file_type]"

      assert_select "input#campaign_preload_grffk_grffk_url[name=?]", "campaign_preload_grffk[grffk_url]"
    end
  end
end
