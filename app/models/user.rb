class User < ApplicationRecord
  has_one :person
  has_one :family, through: :person

  validates :username, uniqueness: true
  has_secure_password

  def to_s
    self.first_name + " " + self.last_name
  end

end
