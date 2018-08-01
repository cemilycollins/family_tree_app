Person.destroy_all
Relationship.destroy_all
Partnership.destroy_all


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.string :first_name
# t.string :last_name
# t.date :dob
# t.date :dod
# t.boolean :deceased
# t.string :gender
# t.string :place_of_birth
# t.string :current_location
#

Person.create([
  {
    first_name: "Jay",
    last_name: "Pritchett",
    dob: Date.parse("1947-5-23"),
    deceased: false, gender: "male",
    place_of_birth: "Youngstown, Ohio",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "DeDe",
    last_name: "Pritchett",
    dob: Date.parse("1947-1-23"),
    deceased: false, gender: "female",
    place_of_birth: "Sacramento, California",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Claire",
    last_name: "Dunphy",
    dob: Date.parse("1970-3-3"),
    deceased: false, gender: "female",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Phil",
    last_name: "Dunphy",
    dob: Date.parse("1969-4-3"),
    deceased: false, gender: "male",
    place_of_birth: "Orlando, Florida",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Haley",
    last_name: "Dunphy",
    dob: Date.parse("1993-12-10"),
    deceased: false, gender: "female",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Alex",
    last_name: "Dunphy",
    dob: Date.parse("1997-1-14"),
    deceased: false, gender: "female",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Luke",
    last_name: "Dunphy",
    dob: Date.parse("1998-11-28"),
    deceased: false, gender: "male",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Mitchell",
    last_name: "Tucker-Pritchett",
    dob: Date.parse("1973-1-4"),
    deceased: false, gender: "male",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Cameron",
    last_name: "Tucker-Pritchett",
    dob: Date.parse("1972-2-29"),
    deceased: false, gender: "female",
    place_of_birth: "St. Louis, Missouri",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Lily",
    last_name: "Tucker-Pritchett",
    dob: Date.parse("2008-2-19"),
    deceased: false, gender: "female",
    place_of_birth: "Hanoi, Vietnam",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Gloria",
    last_name: "Delgado-Pritchett",
    dob: Date.parse("1971-5-10"),
    deceased: false, gender: "female",
    place_of_birth: "Barranquilla, Colombia",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Javier",
    last_name: "Delgado",
    dob: Date.parse("1971-2-18"),
    deceased: false, gender: "male",
    place_of_birth: "Barranquilla, Colombia",
    current_location: "Barranquilla, Colombia"
  },
  {
    first_name: "Manny",
    last_name: "Delgado",
    dob: Date.parse("1999-1-4"),
    deceased: false, gender: "male",
    place_of_birth: "Barranquilla, Colombia",
    current_location: "Los Angeles, California"
  },
  {
    first_name: "Joe",
    last_name: "Pritchett",
    dob: Date.parse("2013-1-29"),
    deceased: false, gender: "male",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California"
  }
])

Relationship.create([
  { child: Person.find_by(first_name: "Claire"), parent: Person.find_by(first_name: "Jay")},
  { child: Person.find_by(first_name: "Mitchell"), parent: Person.find_by(first_name: "Jay")},
  { child: Person.find_by(first_name: "Mitchell"), parent: Person.find_by(first_name: "DeDe")},
  { child: Person.find_by(first_name: "Claire"), parent: Person.find_by(first_name: "DeDe")},
  { child: Person.find_by(first_name: "Haley"), parent: Person.find_by(first_name: "Claire")},
  { child: Person.find_by(first_name: "Alex"), parent: Person.find_by(first_name: "Claire")},
  { child: Person.find_by(first_name: "Luke"), parent: Person.find_by(first_name: "Claire")},
  { child: Person.find_by(first_name: "Haley"), parent: Person.find_by(first_name: "Phil")},
  { child: Person.find_by(first_name: "Alex"), parent: Person.find_by(first_name: "Phil")},
  { child: Person.find_by(first_name: "Luke"), parent: Person.find_by(first_name: "Phil")},
  { child: Person.find_by(first_name: "Lily"), parent: Person.find_by(first_name: "Mitchell")},
  { child: Person.find_by(first_name: "Lily"), parent: Person.find_by(first_name: "Cameron")},
  { child: Person.find_by(first_name: "Manny"), parent: Person.find_by(first_name: "Gloria")},
  { child: Person.find_by(first_name: "Manny"), parent: Person.find_by(first_name: "Javier")},
  { child: Person.find_by(first_name: "Manny"), parent: Person.find_by(first_name: "Jay")},
  { child: Person.find_by(first_name: "Joe"), parent: Person.find_by(first_name: "Gloria")},
  { child: Person.find_by(first_name: "Joe"), parent: Person.find_by(first_name: "Jay")}
  ])

  Partnership.create([
    { person: Person.find_by(first_name: "Jay"), partner: Person.find_by(first_name: "DeDe"), status: "divorced"},
    { person: Person.find_by(first_name: "Jay"), partner: Person.find_by(first_name: "Gloria"), status: "married"},
    { person: Person.find_by(first_name: "DeDe"), partner: Person.find_by(first_name: "Jay"), status: "divorced"},
    { person: Person.find_by(first_name: "Gloria"), partner: Person.find_by(first_name: "Javier"), status: "divorced"},
    { person: Person.find_by(first_name: "Gloria"), partner: Person.find_by(first_name: "Jay"), status: "married"},
    { person: Person.find_by(first_name: "Javier"), partner: Person.find_by(first_name: "Gloria"), status: "divorced"},
    { person: Person.find_by(first_name: "Claire"), partner: Person.find_by(first_name: "Phil"), status: "married"},
    { person: Person.find_by(first_name: "Phil"), partner: Person.find_by(first_name: "Claire"), status: "married"},
    { person: Person.find_by(first_name: "Mitchell"), partner: Person.find_by(first_name: "Cameron"), status: "married"},
    { person: Person.find_by(first_name: "Cameron"), partner: Person.find_by(first_name: "Mitchell"), status: "married"}
  ])
