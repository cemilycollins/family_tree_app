class Person < ApplicationRecord
  has_many :parent_relationships, class_name: "Relationship", foreign_key: "child_id"
  has_many :child_relationships, class_name: "Relationship", foreign_key: "parent_id"
  has_many :parents, through: :parent_relationships
  has_many :children, through: :child_relationships
  has_many :partnerships
  has_many :partners, class_name: "Partnership"
  has_many :ethnicities

  def to_s
    self.first_name + " " + self.last_name
  end

end
