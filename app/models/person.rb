class Person < ApplicationRecord
  has_many :parent_relationships, class_name: "Relationship", foreign_key: "child_id"
  has_many :child_relationships, class_name: "Relationship", foreign_key: "parent_id"
  has_many :parents, through: :parent_relationships
  has_many :children, through: :child_relationships
  has_many :ethnicities

  def to_s
    self.first_name + " " + self.last_name
  end

  def siblings
    sibs_array = []
    self.parents.each do |parent|
      parent.children.each do |child|
        if !sibs_array.include?(child)
          sibs_array << child
        end
      end
    end
    sibs_array.delete(self)
    sibs_array
  end

end
