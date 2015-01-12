require 'rails_helper'

RSpec.describe "kakoona_videos/new", :type => :view do
  before(:each) do
    assign(:kakoona_video, KakoonaVideo.new(
      :ad_campaign => nil,
      :duration => 1,
      :raw_file_name => "MyString",
      :format_type => "MyString",
      :file_size => "MyString",
      :vid_views => 1,
      :vid_url => "MyString",
      :genre => "MyString",
      :vid_description => "MyText",
      :meta_tags => "MyText",
      :tender_video_thum => nil
    ))
  end

  it "renders new kakoona_video form" do
    render

    assert_select "form[action=?][method=?]", kakoona_videos_path, "post" do

      assert_select "input#kakoona_video_ad_campaign_id[name=?]", "kakoona_video[ad_campaign_id]"

      assert_select "input#kakoona_video_duration[name=?]", "kakoona_video[duration]"

      assert_select "input#kakoona_video_raw_file_name[name=?]", "kakoona_video[raw_file_name]"

      assert_select "input#kakoona_video_format_type[name=?]", "kakoona_video[format_type]"

      assert_select "input#kakoona_video_file_size[name=?]", "kakoona_video[file_size]"

      assert_select "input#kakoona_video_vid_views[name=?]", "kakoona_video[vid_views]"

      assert_select "input#kakoona_video_vid_url[name=?]", "kakoona_video[vid_url]"

      assert_select "input#kakoona_video_genre[name=?]", "kakoona_video[genre]"

      assert_select "textarea#kakoona_video_vid_description[name=?]", "kakoona_video[vid_description]"

      assert_select "textarea#kakoona_video_meta_tags[name=?]", "kakoona_video[meta_tags]"

      assert_select "input#kakoona_video_tender_video_thum_id[name=?]", "kakoona_video[tender_video_thum_id]"
    end
  end
end
