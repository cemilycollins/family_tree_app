class User < ApplicationRecord
  has_one :person
  has_one :family, through: :person

  validates :username, uniqueness: true
  has_secure_password

end
