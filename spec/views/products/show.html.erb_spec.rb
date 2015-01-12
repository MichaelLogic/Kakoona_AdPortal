require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :merchant => nil,
      :product_type => "Product Type",
      :grffk_url => "Grffk Url",
      :price => 1.5,
      :description => "Description",
      :size => "Size",
      :color => "Color",
      :weight => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Product Type/)
    expect(rendered).to match(/Grffk Url/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/1/)
  end
end
