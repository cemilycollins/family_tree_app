class ChangeColumnTypeForEthnicities < ActiveRecord::Migration[5.2]
  def change
    rename_column :ethnicities, :type, :name
  end
end
