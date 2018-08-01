class AddTypeToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :photo_type, :string
  end
end
