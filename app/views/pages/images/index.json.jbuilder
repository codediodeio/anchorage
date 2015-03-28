json.array!(@images) do |image|
  json.extract! image, :id, :file, :description, :user_id, :location_id
  json.url image_url(image, format: :json)
end
