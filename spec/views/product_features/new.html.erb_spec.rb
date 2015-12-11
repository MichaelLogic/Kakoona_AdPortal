require 'rails_helper'

RSpec.describe "product_features/new", type: :view do
  before(:each) do
    assign(:product_feature, ProductFeature.new(
      :product => nil,
      :ftr_name => "MyString",
      :ftr_detail => "MyString"
    ))
  end

  it "renders new product_feature form" do
    render

    assert_select "form[action=?][method=?]", product_features_path, "post" do

      assert_select "input#product_feature_product_id[name=?]", "product_feature[product_id]"

      assert_select "input#product_feature_ftr_name[name=?]", "product_feature[ftr_name]"

      assert_select "input#product_feature_ftr_detail[name=?]", "product_feature[ftr_detail]"
    end
  end
end
