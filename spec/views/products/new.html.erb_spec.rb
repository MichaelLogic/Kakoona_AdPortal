require 'rails_helper'

RSpec.describe "products/new", :type => :view do
  before(:each) do
    assign(:product, Product.new(
      :merchant => nil,
      :product_type => "MyString",
      :grffk_url => "MyString",
      :price => 1.5,
      :description => "MyString",
      :size => "MyString",
      :color => "MyString",
      :weight => 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_merchant_id[name=?]", "product[merchant_id]"

      assert_select "input#product_product_type[name=?]", "product[product_type]"

      assert_select "input#product_grffk_url[name=?]", "product[grffk_url]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_description[name=?]", "product[description]"

      assert_select "input#product_size[name=?]", "product[size]"

      assert_select "input#product_color[name=?]", "product[color]"

      assert_select "input#product_weight[name=?]", "product[weight]"
    end
  end
end
