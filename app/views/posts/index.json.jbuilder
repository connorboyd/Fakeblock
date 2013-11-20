json.array!(@posts) do |post|
  json.extract! post, :post_id, :user_id, :time_posted, :status, :on_wall_of_user
  json.url post_url(post, format: :json)
end
