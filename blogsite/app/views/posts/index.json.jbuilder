json.array!(@posts) do |post|
  json.extract! post, :id, :Blog
  json.url post_url(post, format: :json)
end
