class CreateInterlibraryLoans < ActiveRecord::Migration
  def change
    create_table :interlibrary_loans do |t|
      t.integer :oclc_number
      t.string :request_type
      t.datetime :transaction_date

      t.timestamps null: false
    end
  end
end
