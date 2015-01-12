require 'rails_helper'

RSpec.describe "merch_representatives/show", :type => :view do
  before(:each) do
    @merch_representative = assign(:merch_representative, MerchRepresentative.create!(
      :merchant => nil,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Screen Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Team Role/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Auth Token/)
    expect(rendered).to match(/Last Session Ip/)
  end
end
