json.array!(@user_infos) do |user_info|
  json.extract! user_info, :user_id, :hometown, :birthday, :school, :job, :quotes
  json.url user_info_url(user_info, format: :json)
end
