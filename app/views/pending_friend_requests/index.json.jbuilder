json.array!(@pending_friend_requests) do |pending_friend_request|
  json.extract! pending_friend_request, :from_user_id, :to_user_id, :date_requested
  json.url pending_friend_request_url(pending_friend_request, format: :json)
end
