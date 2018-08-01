class Family < ApplicationRecord
  has_many :people
  has_many :photos
end
