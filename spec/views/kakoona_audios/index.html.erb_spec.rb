require 'rails_helper'

RSpec.describe "kakoona_audios/index", :type => :view do
  before(:each) do
    assign(:kakoona_audios, [
      KakoonaAudio.create!(
        :audio_title => "Audio Title",
        :source => "Source",
        :artwork_url => 1,
        :description => "Description",
        :duration => 2,
        :genre => "Genre",
        :label_name => "Label Name",
        :waveform_url => "Waveform Url",
        :download_url => "Download Url",
        :stream_url => "Stream Url",
        :bpm => 1.5
      ),
      KakoonaAudio.create!(
        :audio_title => "Audio Title",
        :source => "Source",
        :artwork_url => 1,
        :description => "Description",
        :duration => 2,
        :genre => "Genre",
        :label_name => "Label Name",
        :waveform_url => "Waveform Url",
        :download_url => "Download Url",
        :stream_url => "Stream Url",
        :bpm => 1.5
      )
    ])
  end

  it "renders a list of kakoona_audios" do
    render
    assert_select "tr>td", :text => "Audio Title".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => "Label Name".to_s, :count => 2
    assert_select "tr>td", :text => "Waveform Url".to_s, :count => 2
    assert_select "tr>td", :text => "Download Url".to_s, :count => 2
    assert_select "tr>td", :text => "Stream Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
