class Photo < ApplicationRecord
  belongs_to :family

  validates :name, presence: true
  validates :img_url, presence: true
  
end
