class AddMaterialTypeToMonographHoldings < ActiveRecord::Migration
  def change
    add_column :monograph_holdings, :material_type, :string
  end
end
