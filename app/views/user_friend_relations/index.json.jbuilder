json.array!(@user_friend_relations) do |user_friend_relation|
  json.extract! user_friend_relation, :user_id1, :user_id2
  json.url user_friend_relation_url(user_friend_relation, format: :json)
end
