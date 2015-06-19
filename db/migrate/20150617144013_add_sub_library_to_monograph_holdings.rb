class AddSubLibraryToMonographHoldings < ActiveRecord::Migration
  def change
    add_column :monograph_holdings, :sub_library, :string
  end
end
