class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
    	t.belongs_to :user
    	t.belongs_to :discipline
    	t.string :role_to_User
    	t.index [:user_id, :discipline_id], unique:

      	t.timestamps null: false
    end
  end
end
