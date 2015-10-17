class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
    	t.belongs_to :student
    	t.belongs_to :discipline
    	t.index [:student_id, :discipline_id], unique:

      	t.timestamps null: false
    end
  end
end
