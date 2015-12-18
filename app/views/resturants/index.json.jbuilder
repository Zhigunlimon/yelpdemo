json.array!(@resturants) do |resturant|
  json.extract! resturant, :id, :name, :address, :phone, :website
  json.url resturant_url(resturant, format: :json)
end
