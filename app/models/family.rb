class Family < ApplicationRecord
  has_many :people
  has_many :photos
  accepts_nested_attributes_for :photos

  def family_portrait
    self.photos.find {|photo| photo.photo_type = "family portrait"}.img_url
  end

end
