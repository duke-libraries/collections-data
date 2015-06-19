class AddCollectionToMonographHoldings < ActiveRecord::Migration
  def change
    add_column :monograph_holdings, :collection, :string
  end
end
