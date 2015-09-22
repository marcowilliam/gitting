# Creating variables and automatically generating the database schemma to Discipline Class


class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
    	t.string :discipline_name
    	t.text :discipline_description
    	t.string :discipline_year
    	t.timestamps null: false
    end
  end
end
