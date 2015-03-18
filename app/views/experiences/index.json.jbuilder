json.array!(@experiences) do |experience|
  json.extract! experience, :id, :user_id, :location_id, :body
  json.url experience_url(experience, format: :json)
end
