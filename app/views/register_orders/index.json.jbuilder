json.array!(@register_orders) do |register_order|
  json.extract! register_order, :register_orders_id, :user, :time, :version, :product, :color, :quantity, :delivery_time, :customer, :remark
  json.url register_order_url(register_order, format: :json)
end
