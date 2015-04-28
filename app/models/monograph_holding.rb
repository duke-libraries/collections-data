class MonographHolding < ActiveRecord::Base
  has_and_belongs_to_many :analysis_groups
end
