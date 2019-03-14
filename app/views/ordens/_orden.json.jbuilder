json.extract! orden, :id, :branch, :code, :start_preparation, :delivery_time, :delivery_method, :delivery_method, :cash_payment, :subtotal, :taxes, :total, :status, :created_at, :updated_at
json.url orden_url(orden, format: :json)
