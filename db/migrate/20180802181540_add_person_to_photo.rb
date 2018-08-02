class AddPersonToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :person_id, :integer
  end
end
