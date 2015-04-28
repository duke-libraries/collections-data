class AddLendingLibraryToInterlibraryLoan < ActiveRecord::Migration
  def change
    add_column :interlibrary_loans, :lending_library, :string
  end
end
