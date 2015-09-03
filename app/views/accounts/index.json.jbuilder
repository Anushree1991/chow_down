json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :description, :welcome_msg
  json.url account_url(account, format: :json)
end
