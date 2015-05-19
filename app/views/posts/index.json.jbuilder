json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :description
  json.url post_url(post, format: :json)
end
