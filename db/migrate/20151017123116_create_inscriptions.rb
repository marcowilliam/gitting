class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
    	t.belongs_to :user
    	t.belongs_to :discipline
    	t.index [:user_id, :discipline_id], unique: true
      	t.timestamps null: false
    end
	end

end
