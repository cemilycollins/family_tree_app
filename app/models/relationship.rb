class Relationship < ApplicationRecord
  belongs_to :parent, class_name: "Person", dependent: :destroy
  belongs_to :child, class_name: "Person", dependent: :destroy

  validates :child_id, uniqueness: {scope: :parent_id}



end
