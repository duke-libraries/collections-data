json.array!(@monograph_holdings) do |monograph_holding|
  json.extract! monograph_holding, :id, :oclc_number, :lc_number, :title, :author, :publisher, :price, :acquisition_modality
  json.url monograph_holding_url(monograph_holding, format: :json)
end
