class CreateJoinTableAnalysisGroupMonographHolding < ActiveRecord::Migration
  def change
    create_join_table :analysis_groups, :monograph_holdings do |t|
      # t.index [:analysis_group_id, :monograph_holding_id]
      # t.index [:monograph_holding_id, :analysis_group_id]
    end
  end
end
