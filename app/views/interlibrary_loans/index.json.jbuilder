json.array!(@interlibrary_loans) do |interlibrary_loan|
  json.extract! interlibrary_loan, :id, :oclc_number, :request_type, :transaction_date
  json.url interlibrary_loan_url(interlibrary_loan, format: :json)
end
