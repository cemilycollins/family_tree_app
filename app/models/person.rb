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

  def all_parents
    p_hash = {}
    self.parent_relationships.each do |rel|
      if rel.blood_related && rel.parent.gender.downcase == "male"
        p_hash[rel.parent.to_s] = "father"
      elsif rel.blood_related && rel.parent.gender.downcase == "female"
        p_hash[rel.parent.to_s] = "mother"
      elsif rel.parent.gender.downcase == "male"
        p_hash[rel.parent.to_s] = "stepfather"
      elsif child.gender.downcase == "female"
        p_hash[rel.parent.to_s] = "stepmother"
      end
    end
    p_hash
  end

  def all_children
    c_hash = {}
    self.child_relationships.each do |rel|
      if rel.blood_related && rel.child.gender.downcase == "male"
        c_hash[rel.child.to_s] = "son"
      elsif rel.blood_related && rel.child.gender.downcase == "female"
        c_hash[rel.child.to_s] = "daughter"
      elsif rel.child.gender.downcase == "male"
        c_hash[rel.child.to_s] = "adopted son"
      elsif child.gender.downcase == "female"
        c_hash[rel.child.to_s] = "adopted daughter"
      end
    end
    c_hash
  end


  def all_siblings
    sibs_hash = {}
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

  def all_grandparents
    parents_hash = {}
    self.parents.each do |parent|
      parent.parents.each do |gp|
        if self.blood_related_parents.include?(parent) && parent.blood_related_parents.include?(gp) && gp.gender.downcase == "male"
          parents_hash[gp.to_s] = "grandfather"
        elsif self.blood_related_parents.include?(parent) && parent.blood_related_parents.include?(gp) && gp.gender.downcase == "female"
          parents_hash[gp.to_s] = "grandmother"
        elsif gp.gender.downcase == "male"
          parents_hash[gp.to_s] = "grandfather - not blood-related"
        elsif gp.gender.downcase == "female"
          parents_hash[gp.to_s] = "grandfather - not blood-related"
        end
      end
    end
    parents_hash
  end

  def all_neices_nephews
    nn_hash = {}
    self.parents.each do |parent|
      parent.children.each do |sib|
        if sib != self
          sib.children.each do |nn|
            if self.blood_related_parents.include?(parent) && sib.blood_related_parents.include?(parent) && nn.blood_related_parents.include?(sib) && gp.gender.downcase == "male"
              nn_hash[nn.to_s] = "nephew"
            elsif self.blood_related_parents.include?(parent) && sib.blood_related_parents.include?(parent) && nn.blood_related_parents.include?(sib) && gp.gender.downcase == "female"
              nn_hash[nn.to_s] = "neice"
            elsif nn.gender.downcase == "male"
              nn_hash[nn.to_s] = "nephew - not blood-related"
            elsif nn.gender.downcase == "female"
              nn_hash[nn.to_s] = "neice - not blood-related"
            end
          end
        end
      end
    end
    nn_hash
  end

  def all_aunts_uncles
    au_hash = {}
    self.parents.each do |parent|
      parent.siblings.each do |sib|
        if self.blood_related_parents.include?(parent) && sib.gender.downcase == "male"
          au_hash[sib.to_s] = "uncle"
        elsif self.blood_related_parents.include?(parent) && sib.gender.downcase == "female"
          au_hash[sib.to_s] = "aunt"
        elsif sib.gender.downcase == "male"
          au_hash[sib.to_s] = "uncle - not blood-related"
        elsif sib.gender.downcase == "female"
          au_hash[sib.to_s] = "aunt - not blood-related"
        end
      end
    end
    au_hash
  end

  def all_cousins
    cuz_hash = {}
    self.parents.each do |parent|
      parent.siblings.each do |au|
        au.children.each do |cuz|
          if !parent.all_siblings[au.to_s].include?("step") && self.blood_related_parents.include?(parent) && cuz.blood_related_parents.include?(au)
            cuz_hash[cuz.to_s] = "cousin"
          else
            cuz_hash[cuz.to_s] = "cousin - not blood-related"
          end
        end
      end
    end
    cuz_hash
  end

  def all_family_members
    fam_hash = {}
    fam_array = [self.all_cousins, self.all_parents, self.all_siblings, self.all_children, self.all_aunts_uncles, self.all_grandparents, self.all_neices_nephews]
    fam_array.each do |hash|
      hash.each do |key, value|
        fam_hash[key] = value
      end
    end
    fam_hash
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
