class Person < ApplicationRecord
  has_many :parent_relationships, class_name: "Relationship", foreign_key: "child_id"
  has_many :child_relationships, class_name: "Relationship", foreign_key: "parent_id"
  has_many :parents, through: :parent_relationships
  has_many :children, through: :child_relationships
  has_many :partnerships
  has_many :partners, through: :partnerships, foreign_key: "partner_id"
  has_many :ethnicities
  belongs_to :family


  # These were lines I used in the person edit form to update a person's parents.
  # There were also new methods in Relationship class for .parent_name and .parent_name=
  # accepts_nested_attributes_for :parent_relationships
  # <%= f.label :edit_parents %><br>
  # <%= f.fields_for :parent_relationships do |t| %>
  #   <%= t.label :parent_name %>
  #   <%= t.text_field :parent_name %>
  #   <% end %>

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

  def grandparents
    g_array = []
    self.parents.each do |parent|
      # if parent.blood_related == true
      parent.parents.each do |gparent|
        g_array << gparent
      end
    end
    g_array
  end

end
