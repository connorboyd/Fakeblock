json.array!(@users) do |user|
  json.extract! user, :user_id, :email, :first_name, :last_name, :password
  json.url user_url(user, format: :json)
end
