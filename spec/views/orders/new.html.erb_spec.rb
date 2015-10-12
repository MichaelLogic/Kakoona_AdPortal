require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :ad_campaign => nil,
      :selected_product_model => "MyString",
      :quantity => 1,
      :total_sale => 1.5,
      :shipping_needed => false,
      :consumer => nil,
      :address_line01 => "MyString",
      :address_line02 => "MyString",
      :city => "MyString",
      :state_province => "MyString",
      :postal_code => "MyString",
      :country_region => "MyString",
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_ad_campaign_id[name=?]", "order[ad_campaign_id]"

      assert_select "input#order_selected_product_model[name=?]", "order[selected_product_model]"

      assert_select "input#order_quantity[name=?]", "order[quantity]"

      assert_select "input#order_total_sale[name=?]", "order[total_sale]"

      assert_select "input#order_shipping_needed[name=?]", "order[shipping_needed]"

      assert_select "input#order_consumer_id[name=?]", "order[consumer_id]"

      assert_select "input#order_address_line01[name=?]", "order[address_line01]"

      assert_select "input#order_address_line02[name=?]", "order[address_line02]"

      assert_select "input#order_city[name=?]", "order[city]"

      assert_select "input#order_state_province[name=?]", "order[state_province]"

      assert_select "input#order_postal_code[name=?]", "order[postal_code]"

      assert_select "input#order_country_region[name=?]", "order[country_region]"

      assert_select "input#order_lat[name=?]", "order[lat]"

      assert_select "input#order_lng[name=?]", "order[lng]"
    end
  end
end
