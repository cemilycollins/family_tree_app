class Family < ApplicationRecord
  has_many :people
  has_many :photos

  def family_portrait
    self.photos.find {|photo| photo.photo_type = "family portrait"}
  end

end
