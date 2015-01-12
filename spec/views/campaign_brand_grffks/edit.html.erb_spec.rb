require 'rails_helper'

RSpec.describe "campaign_brand_grffks/edit", :type => :view do
  before(:each) do
    @campaign_brand_grffk = assign(:campaign_brand_grffk, CampaignBrandGrffk.create!(
      :ad_campaign => nil,
      :raw_file_name => "MyString",
      :meta_description => "MyString",
      :file_type => "MyString",
      :grffk_url => "MyString"
    ))
  end

  it "renders the edit campaign_brand_grffk form" do
    render

    assert_select "form[action=?][method=?]", campaign_brand_grffk_path(@campaign_brand_grffk), "post" do

      assert_select "input#campaign_brand_grffk_ad_campaign_id[name=?]", "campaign_brand_grffk[ad_campaign_id]"

      assert_select "input#campaign_brand_grffk_raw_file_name[name=?]", "campaign_brand_grffk[raw_file_name]"

      assert_select "input#campaign_brand_grffk_meta_description[name=?]", "campaign_brand_grffk[meta_description]"

      assert_select "input#campaign_brand_grffk_file_type[name=?]", "campaign_brand_grffk[file_type]"

      assert_select "input#campaign_brand_grffk_grffk_url[name=?]", "campaign_brand_grffk[grffk_url]"
    end
  end
end
