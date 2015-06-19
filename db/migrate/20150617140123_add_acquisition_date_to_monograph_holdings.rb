class AddAcquisitionDateToMonographHoldings < ActiveRecord::Migration
  def change
    add_column :monograph_holdings, :acquisition_date, :date
  end
end
