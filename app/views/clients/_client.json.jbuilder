json.extract! client, :id, :name, :lastname, :number_document, :phone, :address, :created_at, :updated_at
json.url client_url(client, format: :json)
