class CreateEthnicities < ActiveRecord::Migration[5.2]
  def change
    create_table :ethnicities do |t|
      t.string :type
      t.integer :person_id

      t.timestamps
    end
  end
end
