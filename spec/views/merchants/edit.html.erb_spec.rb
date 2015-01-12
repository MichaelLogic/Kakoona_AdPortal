require 'rails_helper'

RSpec.describe "merchants/edit", :type => :view do
  before(:each) do
    @merchant = assign(:merchant, Merchant.create!(
      :merchant_name => "MyString",
      :merchant_website => "MyString",
      :business_license => false,
      :chargeback_email => "MyString",
      :support_email => "MyString",
      :custom_order_init => false,
      :curr_monthly_sales => "MyString"
    ))
  end

  it "renders the edit merchant form" do
    render

    assert_select "form[action=?][method=?]", merchant_path(@merchant), "post" do

      assert_select "input#merchant_merchant_name[name=?]", "merchant[merchant_name]"

      assert_select "input#merchant_merchant_website[name=?]", "merchant[merchant_website]"

      assert_select "input#merchant_business_license[name=?]", "merchant[business_license]"

      assert_select "input#merchant_chargeback_email[name=?]", "merchant[chargeback_email]"

      assert_select "input#merchant_support_email[name=?]", "merchant[support_email]"

      assert_select "input#merchant_custom_order_init[name=?]", "merchant[custom_order_init]"

      assert_select "input#merchant_curr_monthly_sales[name=?]", "merchant[curr_monthly_sales]"
    end
  end
end
