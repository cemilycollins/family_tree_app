class AddBloodRelatedToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :blood_related, :boolean
  end
end
