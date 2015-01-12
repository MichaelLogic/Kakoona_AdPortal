json.array!(@kakoona_audios) do |kakoona_audio|
  json.extract! kakoona_audio, :id, :audio_title, :source, :artwork_url, :description, :duration, :genre, :label_name, :release_date, :waveform_url, :download_url, :stream_url, :bpm
  json.url kakoona_audio_url(kakoona_audio, format: :json)
end
