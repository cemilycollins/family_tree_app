class Photo < ApplicationRecord
  belongs_to :family

  validates :name, uniqueness: true, presence: true
  validates :img_url, presence: true
  
end
