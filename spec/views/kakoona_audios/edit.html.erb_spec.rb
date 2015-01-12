require 'rails_helper'

RSpec.describe "kakoona_audios/edit", :type => :view do
  before(:each) do
    @kakoona_audio = assign(:kakoona_audio, KakoonaAudio.create!(
      :audio_title => "MyString",
      :source => "MyString",
      :artwork_url => 1,
      :description => "MyString",
      :duration => 1,
      :genre => "MyString",
      :label_name => "MyString",
      :waveform_url => "MyString",
      :download_url => "MyString",
      :stream_url => "MyString",
      :bpm => 1.5
    ))
  end

  it "renders the edit kakoona_audio form" do
    render

    assert_select "form[action=?][method=?]", kakoona_audio_path(@kakoona_audio), "post" do

      assert_select "input#kakoona_audio_audio_title[name=?]", "kakoona_audio[audio_title]"

      assert_select "input#kakoona_audio_source[name=?]", "kakoona_audio[source]"

      assert_select "input#kakoona_audio_artwork_url[name=?]", "kakoona_audio[artwork_url]"

      assert_select "input#kakoona_audio_description[name=?]", "kakoona_audio[description]"

      assert_select "input#kakoona_audio_duration[name=?]", "kakoona_audio[duration]"

      assert_select "input#kakoona_audio_genre[name=?]", "kakoona_audio[genre]"

      assert_select "input#kakoona_audio_label_name[name=?]", "kakoona_audio[label_name]"

      assert_select "input#kakoona_audio_waveform_url[name=?]", "kakoona_audio[waveform_url]"

      assert_select "input#kakoona_audio_download_url[name=?]", "kakoona_audio[download_url]"

      assert_select "input#kakoona_audio_stream_url[name=?]", "kakoona_audio[stream_url]"

      assert_select "input#kakoona_audio_bpm[name=?]", "kakoona_audio[bpm]"
    end
  end
end
