class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :discipline
      t.references :user
      t.string :project_name
      t.string :project_description
      t.string :source
      t.timestamps null: false
    end
  end
end
