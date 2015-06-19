class MonographHolding < ActiveRecord::Base
  has_and_belongs_to_many :analysis_groups

  scope :sub_library, -> (sub_library) { where sub_library: sub_library.split(",") }
  scope :language, -> (language) { where language: language.split(",") }

  def interlibrary_loans_count
    InterlibraryLoan.where(oclc_number: self.oclc_number, request_type: "Loan").count
  end

  def overlap_holdings_count(overlap_group_id)
    overlap_holdings = OverlapHolding.where(oclc_number: self.oclc_number).where(overlap_group_id: overlap_group_id).first
    if overlap_holdings.nil?
      overlap_holdings = 0
    else
      overlap_holdings = overlap_holdings.shared_by
    end
  end

  def circulation_count
    Circulation.where(oclc_number: self.oclc_number).count
  end

end
