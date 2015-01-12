require 'rails_helper'

RSpec.describe "kakoona_videos/show", :type => :view do
  before(:each) do
    @kakoona_video = assign(:kakoona_video, KakoonaVideo.create!(
      :ad_campaign => nil,
      :duration => 1,
      :raw_file_name => "Raw File Name",
      :format_type => "Format Type",
      :file_size => "File Size",
      :vid_views => 2,
      :vid_url => "Vid Url",
      :genre => "Genre",
      :vid_description => "MyText",
      :meta_tags => "MyText",
      :tender_video_thum => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Raw File Name/)
    expect(rendered).to match(/Format Type/)
    expect(rendered).to match(/File Size/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Vid Url/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
