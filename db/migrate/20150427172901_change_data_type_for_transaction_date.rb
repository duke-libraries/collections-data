class ChangeDataTypeForTransactionDate < ActiveRecord::Migration
  def self.up
    change_table :interlibrary_loans do |t|
      t.change :transaction_date, :date
    end
  end
  def self.down
    change_table :interlibrary_loans do |t|
      t.change :transaction_date, :datetime
    end
  end
end
