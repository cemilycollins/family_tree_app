class AddFamilyToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :family_id, :integer
  end
end
