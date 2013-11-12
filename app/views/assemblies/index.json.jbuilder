json.array!(@assemblies) do |assembly|
  json.extract! assembly, :shell_color, :spray, :key, :stand, :mark, :numbering_sequence, :remark
  json.url assembly_url(assembly, format: :json)
end
