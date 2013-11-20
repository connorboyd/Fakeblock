json.array!(@books) do |book|
  json.extract! book, :user_id, :book_names
  json.url book_url(book, format: :json)
end
