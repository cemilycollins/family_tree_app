class AddStatusToPartnership < ActiveRecord::Migration[5.2]
  def change
    add_column :partnerships, :status, :string
  end
end
