json.array!(@musics) do |music|
  json.extract! music, :user_id, :artists
  json.url music_url(music, format: :json)
end
