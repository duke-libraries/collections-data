class CreateMonographHoldings < ActiveRecord::Migration
  def change
    create_table :monograph_holdings do |t|
      t.integer :oclc_number
      t.string :lc_number
      t.string :title
      t.string :author
      t.string :publisher
      t.float :price
      t.string :acquisition_modality

      t.timestamps null: false
    end
  end
end
