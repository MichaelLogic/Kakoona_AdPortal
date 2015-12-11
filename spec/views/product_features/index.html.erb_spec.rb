require 'rails_helper'

RSpec.describe "product_features/index", type: :view do
  before(:each) do
    assign(:product_features, [
      ProductFeature.create!(
        :product => nil,
        :ftr_name => "Ftr Name",
        :ftr_detail => "Ftr Detail"
      ),
      ProductFeature.create!(
        :product => nil,
        :ftr_name => "Ftr Name",
        :ftr_detail => "Ftr Detail"
      )
    ])
  end

  it "renders a list of product_features" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ftr Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ftr Detail".to_s, :count => 2
  end
end
