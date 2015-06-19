class AddPublicationYearToMonographHoldings < ActiveRecord::Migration
  def change
    add_column :monograph_holdings, :publication_year, :integer
  end
end
