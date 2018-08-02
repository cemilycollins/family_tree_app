require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  describe Person do
    it "is invalid without first_name" do
      profile = build(:person, first_name: nil)
      expect(person).to have(1).errors_on(:person)
    end

    it "is invalid without last_name" do
      profile = build(:person, last_name: nil)
      expect(person).to have(1).errors_on(:last_name)
    end

    it "is invalid without dob" do
      profile = build(:person, dob: nil)
      expect(person).to have(1).errors_on(:dob)
    end

    it "is invalid without place_of_birth" do
      profile = build(:person, place_of_birth: nil)
      expect(person).to have(1).errors_on(:place_of_birth)
    end

    it "is invalid without current_location" do
      profile = build(:person, current_location: nil)
      expect(person).to have(1).errors_on(:current_location)
    end

    it "is invalid without family_id" do
      profile = build(:person, family_id: nil)
      expect(person).to have(1).errors_on(:family_id)
    end

  end
end
