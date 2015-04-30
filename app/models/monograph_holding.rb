class MonographHolding < ActiveRecord::Base
  has_and_belongs_to_many :analysis_groups

  def interlibrary_loans_count
    InterlibraryLoan.where(oclc_number: self.oclc_number).count
  end

  def overlap_holdings_count
    OverlapHolding.where(oclc_number: self.oclc_number).where(overlap_group_id: 1).first.shared_by
  end
end
