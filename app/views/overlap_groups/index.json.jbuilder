json.array!(@overlap_groups) do |overlap_group|
  json.extract! overlap_group, :id, :name
  json.url overlap_group_url(overlap_group, format: :json)
end
