class CreateOverlapGroups < ActiveRecord::Migration
  def change
    create_table :overlap_groups do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
