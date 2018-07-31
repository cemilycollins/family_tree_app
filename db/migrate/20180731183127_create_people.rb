class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.date :dod
      t.boolean :deceased
      t.string :gender
      t.string :place_of_birth
      t.string :current_location

      t.timestamps
    end
  end
end
