json.array!(@microposts) do |micropost|
  json.extract! micropost, :content, :user_id, :posted_at
  json.url micropost_url(micropost, format: :json)
end