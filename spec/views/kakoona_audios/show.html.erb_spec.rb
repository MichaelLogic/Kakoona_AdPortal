require 'rails_helper'

RSpec.describe "kakoona_audios/show", :type => :view do
  before(:each) do
    @kakoona_audio = assign(:kakoona_audio, KakoonaAudio.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Audio Title/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/Label Name/)
    expect(rendered).to match(/Waveform Url/)
    expect(rendered).to match(/Download Url/)
    expect(rendered).to match(/Stream Url/)
    expect(rendered).to match(/1.5/)
  end
end
