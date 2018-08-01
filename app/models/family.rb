class Family < ApplicationRecord
  has_many :people
  has_one  :photo
end
