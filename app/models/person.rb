class Person < ApplicationRecord
  has_many :parent_relationships, class_name: "Relationship", foreign_key: "child_id"
  has_many :child_relationships, class_name: "Relationship", foreign_key: "parent_id"
  has_many :parents, through: :parent_relationships
  has_many :children, through: :child_relationships
  has_many :partnerships
  has_many :partners, through: :partnerships, foreign_key: "partner_id"
  has_many :ethnicities
  belongs_to :family, optional: true
  has_many :photos
  belongs_to :user, optional: true

  validates :first_name, :last_name, :dob, :place_of_birth, :current_location, presence: true
  accepts_nested_attributes_for :photos



  def to_s
    self.first_name + " " + self.last_name
  end

  def my_ethnicities
    new_hash = {}
    total = 0
    if self.blood_related_parents.empty?
      new_hash["Unknown"] = 100
    else
      self.blood_related_parents.each do |parent|
        if parent.ethnicities.empty?
          new_hash["Unknown"] = 50
          total += 50
        else
          parent.ethnicities.each do |ethnicity|
            half_percentage = ethnicity.percentage/2
            total += half_percentage
            if new_hash.has_key?(ethnicity.name)
              new_hash[ethnicity.name] += half_percentage
            else
              new_hash[ethnicity.name] = half_percentage
            end
          end
        end
      end
      if total < 100 && new_hash.has_key?("Unknown")
        new_hash["Unknown"] += (100 - total)
      elsif total < 100
        new_hash["Unknown"] = (100 - total)
      end
    end
    new_hash
  end

  def blood_related_parents
    a = self.parents.select do |parent|
      Relationship.find_by(parent: parent, child: self).blood_related
    end
    a
  end

  def non_blood_related_parents
    a = self.parents.select do |parent|
      !Relationship.find_by(parent: parent, child: self).blood_related
    end
    a
  end

  def p_relationship(parent)
    b = self.parent_relationships.select do |rel|
      rel.parent == parent
    end
  end

  def c_relationship(child)

  end

  def all_siblings
    sibs_hash = []
    self.parents.each do |parent|
      parent.children.each do |child|
        if child != self
          if self.blood_related_parents.include?(parent) && child.gender.downcase == "male"
            sibs_hash[child.to_s] = "brother"
          elsif self.blood_related_parents.include?(parent) && child.gender.downcase == "female"
            sibs_hash[child.to_s] = "sister"
          elsif child.gender.downcase == "male"
            sibs_hash[child.to_s] = "stepbrother"
          elsif child.gender.downcase == "female"
            sibs_hash[child.to_s] = "stepsister"
          end
        end
      end
    end
    sibs_hash
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

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self_portrait
     self.photos.find {|photo| photo.photo_type == "profile picture"}
  end

  def family_portrait
    self.family.find {|photo| photo.photo_type == "family portrait"}
  end

  def age
    Date.today.year - self.dob.year
  end



end
