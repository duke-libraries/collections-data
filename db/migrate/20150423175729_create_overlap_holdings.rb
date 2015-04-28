class CreateOverlapHoldings < ActiveRecord::Migration
  def change
    create_table :overlap_holdings do |t|
      t.integer :oclc_number
      t.integer :shared_by

      t.timestamps null: false
    end
  end
end
