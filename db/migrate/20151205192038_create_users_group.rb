class CreateUsersGroup < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.references :user
      t.references :group
      t.timestamps null: false
    end
  end
end
