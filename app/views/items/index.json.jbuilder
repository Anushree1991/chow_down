json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :menu_id, :active
  json.url item_url(item, format: :json)
end
