json.array!(@analysis_groups) do |analysis_group|
  json.extract! analysis_group, :id, :name
  json.url analysis_group_url(analysis_group, format: :json)
end
