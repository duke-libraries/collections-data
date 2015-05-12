class CreateCirculations < ActiveRecord::Migration
  def change
    create_table :circulations do |t|
      t.integer :oclc_number
      t.date :loan_date

      t.timestamps null: false
    end
  end
end
