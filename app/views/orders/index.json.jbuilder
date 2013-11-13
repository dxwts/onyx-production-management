json.array!(@orders) do |order|
  json.extract! order, :order_id, :user, :time, :version, :product, :color, :quantity, :delivery_time, :customer, :remark
  json.url order_url(order, format: :json)
end
