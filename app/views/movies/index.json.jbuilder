json.array!(@movies) do |movie|
  json.extract! movie, :user_id, :movie_names
  json.url movie_url(movie, format: :json)
end
