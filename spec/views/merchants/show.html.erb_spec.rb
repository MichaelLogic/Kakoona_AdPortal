require 'rails_helper'

RSpec.describe "merchants/show", :type => :view do
  before(:each) do
    @merchant = assign(:merchant, Merchant.create!(
      :merchant_name => "Merchant Name",
      :merchant_website => "Merchant Website",
      :business_license => false,
      :chargeback_email => "Chargeback Email",
      :support_email => "Support Email",
      :custom_order_init => false,
      :curr_monthly_sales => "Curr Monthly Sales"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Merchant Name/)
    expect(rendered).to match(/Merchant Website/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Chargeback Email/)
    expect(rendered).to match(/Support Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Curr Monthly Sales/)
  end
end
