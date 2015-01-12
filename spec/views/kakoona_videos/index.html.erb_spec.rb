require 'rails_helper'

RSpec.describe "kakoona_videos/index", :type => :view do
  before(:each) do
    assign(:kakoona_videos, [
      KakoonaVideo.create!(
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
      ),
      KakoonaVideo.create!(
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
      )
    ])
  end

  it "renders a list of kakoona_videos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Raw File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Format Type".to_s, :count => 2
    assert_select "tr>td", :text => "File Size".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Vid Url".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
