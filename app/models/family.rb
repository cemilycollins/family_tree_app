class Family < ApplicationRecord
  has_many :people
  has_many :photos
  has_many :users, through: :people
  accepts_nested_attributes_for :photos

  validates :name, presence: true, uniqueness: true

  def family_portrait
    self.photos.find {|photo| photo.photo_type = "family portrait"}.img_url
  end

  def num_of_people
    self.people.count
  end

  def ethnicities
    new_hash = Ethnicity.hash
    total = 0
    self.people.each do |person|
      person.ethnicities.each do |eth|
        new_value = eth.percentage/self.num_of_people
        new_hash[eth.name] += new_value
        total += new_value
      end
    end
    if total < 100
      new_hash["Unknown"] += (100 - total)
    end
    new_hash
  end

end
