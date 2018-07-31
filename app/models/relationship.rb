class Relationship < ApplicationRecord
  belongs_to :parent, class_name: "Person"
  belongs_to :child, class_name: "Person"

  def parent_name
    self.parent.to_s
  end

  def parent_name=(name)
    a = name.split(' ')
    self.parent.first_name = a[0]
    self.parent.last_name = a[0]
  end

end
