require 'rails_helper'

RSpec.describe "merch_representatives/new", :type => :view do
  before(:each) do
    assign(:merch_representative, MerchRepresentative.new(
      :merchant => nil,
      :email => "MyString",
      :screen_name => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :team_role => "MyString",
      :rep_about => "MyText",
      :is_active => false,
      :auth_token => "MyString",
      :last_session_ip => "MyString"
    ))
  end

  it "renders new merch_representative form" do
    render

    assert_select "form[action=?][method=?]", merch_representatives_path, "post" do

      assert_select "input#merch_representative_merchant_id[name=?]", "merch_representative[merchant_id]"

      assert_select "input#merch_representative_email[name=?]", "merch_representative[email]"

      assert_select "input#merch_representative_screen_name[name=?]", "merch_representative[screen_name]"

      assert_select "input#merch_representative_first_name[name=?]", "merch_representative[first_name]"

      assert_select "input#merch_representative_middle_name[name=?]", "merch_representative[middle_name]"

      assert_select "input#merch_representative_last_name[name=?]", "merch_representative[last_name]"

      assert_select "input#merch_representative_phone[name=?]", "merch_representative[phone]"

      assert_select "input#merch_representative_team_role[name=?]", "merch_representative[team_role]"

      assert_select "textarea#merch_representative_rep_about[name=?]", "merch_representative[rep_about]"

      assert_select "input#merch_representative_is_active[name=?]", "merch_representative[is_active]"

      assert_select "input#merch_representative_auth_token[name=?]", "merch_representative[auth_token]"

      assert_select "input#merch_representative_last_session_ip[name=?]", "merch_representative[last_session_ip]"
    end
  end
end
