json.array!(@circulations) do |circulation|
  json.extract! circulation, :id, :oclc_number, :loan_date
  json.url circulation_url(circulation, format: :json)
end
