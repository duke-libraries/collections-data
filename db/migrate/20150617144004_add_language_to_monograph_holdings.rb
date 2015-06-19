class AddLanguageToMonographHoldings < ActiveRecord::Migration
  def change
    add_column :monograph_holdings, :language, :string
  end
end
