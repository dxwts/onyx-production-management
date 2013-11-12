json.array!(@softwares) do |software|
  json.extract! software, :os, :boot_anim, :standby_anim, :poweroff_anim, :language, :software_features, :remark
  json.url software_url(software, format: :json)
end
