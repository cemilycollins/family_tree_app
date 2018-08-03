class Relationship < ApplicationRecord
  belongs_to :parent, class_name: "Person"
  belongs_to :child, class_name: "Person"

  validates :child_id, uniqueness: {scope: :parent_id}



end
