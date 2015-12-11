require 'rails_helper'

RSpec.describe "product_features/show", type: :view do
  before(:each) do
    @product_feature = assign(:product_feature, ProductFeature.create!(
      :product => nil,
      :ftr_name => "Ftr Name",
      :ftr_detail => "Ftr Detail"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Ftr Name/)
    expect(rendered).to match(/Ftr Detail/)
  end
end
