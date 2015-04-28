json.array!(@overlap_holdings) do |overlap_holding|
  json.extract! overlap_holding, :id, :oclc_number, :shared_by
  json.url overlap_holding_url(overlap_holding, format: :json)
end
