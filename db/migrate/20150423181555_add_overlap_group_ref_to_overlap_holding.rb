class AddOverlapGroupRefToOverlapHolding < ActiveRecord::Migration
  def change
    add_reference :overlap_holdings, :overlap_group, index: true, foreign_key: true
  end
end
