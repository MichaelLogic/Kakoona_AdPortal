require 'rails_helper'

RSpec.describe "merchants/index", :type => :view do
  before(:each) do
    assign(:merchants, [
      Merchant.create!(
        :merchant_name => "Merchant Name",
        :merchant_website => "Merchant Website",
        :business_license => false,
        :chargeback_email => "Chargeback Email",
        :support_email => "Support Email",
        :custom_order_init => false,
        :curr_monthly_sales => "Curr Monthly Sales"
      ),
      Merchant.create!(
        :merchant_name => "Merchant Name",
        :merchant_website => "Merchant Website",
        :business_license => false,
        :chargeback_email => "Chargeback Email",
        :support_email => "Support Email",
        :custom_order_init => false,
        :curr_monthly_sales => "Curr Monthly Sales"
      )
    ])
  end

  it "renders a list of merchants" do
    render
    assert_select "tr>td", :text => "Merchant Name".to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Website".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Chargeback Email".to_s, :count => 2
    assert_select "tr>td", :text => "Support Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Curr Monthly Sales".to_s, :count => 2
  end
end
