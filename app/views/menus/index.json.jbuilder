json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :account_id, :active
  json.url menu_url(menu, format: :json)
end
