class ChangeOclcNumberTypeInMonographHoldings < ActiveRecord::Migration
  def change
    change_column :monograph_holdings, :oclc_number, :bigint
  end
end
