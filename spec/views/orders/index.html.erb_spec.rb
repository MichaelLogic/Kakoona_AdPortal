require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :ad_campaign => nil,
        :selected_product_model => "Selected Product Model",
        :quantity => 1,
        :total_sale => 1.5,
        :shipping_needed => false,
        :consumer => nil,
        :address_line01 => "Address Line01",
        :address_line02 => "Address Line02",
        :city => "City",
        :state_province => "State Province",
        :postal_code => "Postal Code",
        :country_region => "Country Region",
        :lat => 1.5,
        :lng => 1.5
      ),
      Order.create!(
        :ad_campaign => nil,
        :selected_product_model => "Selected Product Model",
        :quantity => 1,
        :total_sale => 1.5,
        :shipping_needed => false,
        :consumer => nil,
        :address_line01 => "Address Line01",
        :address_line02 => "Address Line02",
        :city => "City",
        :state_province => "State Province",
        :postal_code => "Postal Code",
        :country_region => "Country Region",
        :lat => 1.5,
        :lng => 1.5
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Selected Product Model".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Address Line01".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line02".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State Province".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country Region".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
