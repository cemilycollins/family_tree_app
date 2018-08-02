class Ethnicity < ApplicationRecord
  belongs_to :person

  validates :percentage, numericality: { maximum: 100, only_integer: true}
  validate :total_ethnicity_percentage_validation
  validates :name, uniqueness: { scope: :person_id }, presence: true

  def total_ethnicity_percentage_validation
    if self.person
      @person = self.person
      ethnicity_sum = 0
      @person.ethnicities.each do |ethnicity|
        ethnicity_sum += ethnicity.percentage
      end
      if ethnicity_sum > 100
        self.errors[:percentage] << 'That percentage is too high. The sum total of all ethnicity percentages must be less than or equal to 100'
      end
    end
  end

  def self.list
    e_array = [
      {name: "White(including Middle Eastern)", percentage: 0},
      {name: "Hispanic or Latino", percentage: 0},
      {name: "Asian/Pacific Islander", percentage: 0},
      {name: "American Indian or Alaska Native", percentage: 0},
      {name: "Black or African American", percentage: 0},
      {name: "Unknown", percentage: 0}
      ]
    a = e_array.map do |hash|
      Ethnicity.new(hash)
    end
    a
  end

  def self.hash
    new_hash = {}
    Ethnicity.list.each do |ethnicity|
      new_hash[ethnicity.name] = ethnicity.percentage
    end
    new_hash
  end

end
