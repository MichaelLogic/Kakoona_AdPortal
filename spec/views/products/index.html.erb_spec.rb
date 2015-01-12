require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :merchant => nil,
        :product_type => "Product Type",
        :grffk_url => "Grffk Url",
        :price => 1.5,
        :description => "Description",
        :size => "Size",
        :color => "Color",
        :weight => 1
      ),
      Product.create!(
        :merchant => nil,
        :product_type => "Product Type",
        :grffk_url => "Grffk Url",
        :price => 1.5,
        :description => "Description",
        :size => "Size",
        :color => "Color",
        :weight => 1
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Product Type".to_s, :count => 2
    assert_select "tr>td", :text => "Grffk Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
