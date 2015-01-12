require 'rails_helper'

RSpec.describe "content_providers/edit", :type => :view do
  before(:each) do
    @content_provider = assign(:content_provider, ContentProvider.create!(
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

  it "renders the edit content_provider form" do
    render

    assert_select "form[action=?][method=?]", content_provider_path(@content_provider), "post" do

      assert_select "input#content_provider_email[name=?]", "content_provider[email]"

      assert_select "input#content_provider_screen_name[name=?]", "content_provider[screen_name]"

      assert_select "input#content_provider_first_name[name=?]", "content_provider[first_name]"

      assert_select "input#content_provider_middle_name[name=?]", "content_provider[middle_name]"

      assert_select "input#content_provider_last_name[name=?]", "content_provider[last_name]"

      assert_select "input#content_provider_phone[name=?]", "content_provider[phone]"

      assert_select "input#content_provider_team_role[name=?]", "content_provider[team_role]"

      assert_select "textarea#content_provider_rep_about[name=?]", "content_provider[rep_about]"

      assert_select "input#content_provider_is_active[name=?]", "content_provider[is_active]"

      assert_select "input#content_provider_auth_token[name=?]", "content_provider[auth_token]"

      assert_select "input#content_provider_last_session_ip[name=?]", "content_provider[last_session_ip]"
    end
  end
end
