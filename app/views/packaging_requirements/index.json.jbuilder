json.array!(@packaging_requirements) do |packaging_requirement|
  json.extract! packaging_requirement, :box_capacity, :binding, :auxiliary_board, :tape, :box_sticker, :mark_box, :remark
  json.url packaging_requirement_url(packaging_requirement, format: :json)
end
