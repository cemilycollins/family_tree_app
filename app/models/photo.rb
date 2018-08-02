class Photo < ApplicationRecord
  belongs_to :family
  validates :name, uniqueness: true
end
