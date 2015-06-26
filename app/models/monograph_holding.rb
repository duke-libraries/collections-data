class MonographHolding < ActiveRecord::Base

  # include Filterable
  
  has_and_belongs_to_many :analysis_groups

  # sub_library[]=Biol-Env.+Sciences+Library
  scope :sub_library, -> (sub_library) { where sub_library: sub_library }
  
  # collection[]=Herbarium+Collection+1+--+Vascular
  scope :collection, -> (collection) { where collection: collection }
  
  # material_type[]=Book&material_type[]=Pamphlet
  scope :material_type, -> (material_type) { where material_type: material_type }
  
  # language[]=eng&language[]=ger
  scope :language, -> (language) { where language: language }
  
  # publication_year=1998,2014
  scope :publication_year, -> (publication_year) { where publication_year: publication_year[0]..publication_year[1] }

  # publisher=boston
  scope :publisher, -> (publisher) { where('publisher LIKE ?', "%#{publisher}%") }

  # acquisition_date = 1998,2014
  scope :acquisition_date, -> (acquisition_date) { where acquisition_date: acquisition_date[0]..acquisition_date[1] }


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
