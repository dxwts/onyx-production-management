json.array!(@custom_tables) do |custom_table|
  json.extract! custom_table, 
  json.url custom_table_url(custom_table, format: :json)
end
