require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Selected Product Model/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address Line01/)
    expect(rendered).to match(/Address Line02/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State Province/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country Region/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
