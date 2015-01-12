require 'rails_helper'

RSpec.describe "content_providers/index", :type => :view do
  before(:each) do
    assign(:content_providers, [
      ContentProvider.create!(
        :email => "Email",
        :screen_name => "Screen Name",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :phone => "Phone",
        :team_role => "Team Role",
        :rep_about => "MyText",
        :is_active => false,
        :auth_token => "Auth Token",
        :last_session_ip => "Last Session Ip"
      ),
      ContentProvider.create!(
        :email => "Email",
        :screen_name => "Screen Name",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :phone => "Phone",
        :team_role => "Team Role",
        :rep_about => "MyText",
        :is_active => false,
        :auth_token => "Auth Token",
        :last_session_ip => "Last Session Ip"
      )
    ])
  end

  it "renders a list of content_providers" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Team Role".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
    assert_select "tr>td", :text => "Last Session Ip".to_s, :count => 2
  end
end
