class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_number
      t.string :group_theme
      t.string :group_description
      t.timestamps null: false
    end
  end
end
