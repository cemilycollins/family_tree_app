class AddPercentageToEthnicities < ActiveRecord::Migration[5.2]
  def change
    add_column :ethnicities, :percentage, :integer
  end
end
