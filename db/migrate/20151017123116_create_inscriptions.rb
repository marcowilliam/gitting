class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|

      t.timestamps null: false
    end
  end
end
