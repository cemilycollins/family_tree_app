Person.destroy_all
Relationship.destroy_all
Partnership.destroy_all
Family.destroy_all
Photo.destroy_all
Ethnicity.destroy_all
User.destroy_all


Family.create([name: "Modern Family"])


Person.create([
  {
    first_name: "Jay",
    last_name: "Pritchett",
    dob: Date.parse("1947-5-23"),
    deceased: false, gender: "male",
    place_of_birth: "Youngstown, Ohio",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "DeDe",
    last_name: "Pritchett",
    dob: Date.parse("1947-1-23"),
    deceased: false, gender: "female",
    place_of_birth: "Sacramento, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Claire",
    last_name: "Dunphy",
    dob: Date.parse("1970-3-3"),
    deceased: false, gender: "female",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Phil",
    last_name: "Dunphy",
    dob: Date.parse("1969-4-3"),
    deceased: false, gender: "male",
    place_of_birth: "Orlando, Florida",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Haley",
    last_name: "Dunphy",
    dob: Date.parse("1993-12-10"),
    deceased: false, gender: "female",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Alex",
    last_name: "Dunphy",
    dob: Date.parse("1997-1-14"),
    deceased: false, gender: "female",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Luke",
    last_name: "Dunphy",
    dob: Date.parse("1998-11-28"),
    deceased: false, gender: "male",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Mitchell",
    last_name: "Tucker-Pritchett",
    dob: Date.parse("1973-1-4"),
    deceased: false, gender: "male",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Cameron",
    last_name: "Tucker-Pritchett",
    dob: Date.parse("1972-2-29"),
    deceased: false, gender: "male",
    place_of_birth: "St. Louis, Missouri",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Lily",
    last_name: "Tucker-Pritchett",
    dob: Date.parse("2008-2-19"),
    deceased: false, gender: "female",
    place_of_birth: "Hanoi, Vietnam",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Gloria",
    last_name: "Delgado-Pritchett",
    dob: Date.parse("1971-5-10"),
    deceased: false, gender: "female",
    place_of_birth: "Barranquilla, Colombia",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Javier",
    last_name: "Delgado",
    dob: Date.parse("1971-2-18"),
    deceased: false, gender: "male",
    place_of_birth: "Barranquilla, Colombia",
    current_location: "Barranquilla, Colombia",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Manny",
    last_name: "Delgado",
    dob: Date.parse("1999-1-4"),
    deceased: false, gender: "male",
    place_of_birth: "Barranquilla, Colombia",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  },
  {
    first_name: "Joe",
    last_name: "Pritchett",
    dob: Date.parse("2013-1-29"),
    deceased: false, gender: "male",
    place_of_birth: "Los Angeles, California",
    current_location: "Los Angeles, California",
    family: Family.find_by(name: "Modern Family")
  }
])

Relationship.create([
  { child: Person.find_by(first_name: "Claire"), parent: Person.find_by(first_name: "Jay"), blood_related: true},
  { child: Person.find_by(first_name: "Mitchell"), parent: Person.find_by(first_name: "Jay"), blood_related: true},
  { child: Person.find_by(first_name: "Mitchell"), parent: Person.find_by(first_name: "DeDe"), blood_related: true},
  { child: Person.find_by(first_name: "Claire"), parent: Person.find_by(first_name: "DeDe"), blood_related: true},
  { child: Person.find_by(first_name: "Haley"), parent: Person.find_by(first_name: "Claire"), blood_related: true},
  { child: Person.find_by(first_name: "Alex"), parent: Person.find_by(first_name: "Claire"), blood_related: true},
  { child: Person.find_by(first_name: "Luke"), parent: Person.find_by(first_name: "Claire"), blood_related: true},
  { child: Person.find_by(first_name: "Haley"), parent: Person.find_by(first_name: "Phil"), blood_related: true},
  { child: Person.find_by(first_name: "Alex"), parent: Person.find_by(first_name: "Phil"), blood_related: true},
  { child: Person.find_by(first_name: "Luke"), parent: Person.find_by(first_name: "Phil"), blood_related: true},
  { child: Person.find_by(first_name: "Lily"), parent: Person.find_by(first_name: "Mitchell"), blood_related: false},
  { child: Person.find_by(first_name: "Lily"), parent: Person.find_by(first_name: "Cameron"), blood_related: false},
  { child: Person.find_by(first_name: "Manny"), parent: Person.find_by(first_name: "Gloria"), blood_related: true},
  { child: Person.find_by(first_name: "Manny"), parent: Person.find_by(first_name: "Javier"), blood_related: true},
  { child: Person.find_by(first_name: "Manny"), parent: Person.find_by(first_name: "Jay"), blood_related: false},
  { child: Person.find_by(first_name: "Joe"), parent: Person.find_by(first_name: "Gloria"), blood_related: true},
  { child: Person.find_by(first_name: "Joe"), parent: Person.find_by(first_name: "Jay"), blood_related: true}
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

  Ethnicity.create([
    { person: Person.find_by(first_name: "Gloria"), name: "Hispanic or Latino", percentage: 100},
    { person: Person.find_by(first_name: "Jay"), name: "White(including Middle Eastern)", percentage: 100},
    { person: Person.find_by(first_name: "DeDe"), name: "White(including Middle Eastern)", percentage: 100}
    ])

    Photo.create([
      {
        name: "Modern Family Photo",
        photo_type: "family portrait",
        img_url: "https://www.tvovermind.com/wp-content/uploads/2017/12/modern-family-tile-deeb3bde.jpg",
        family: Family.find_by(name: "Modern Family")
      },
      {
        name: "Jay Pritchett",
        photo_type: "profile picture",
        img_url: "http://www.usanetwork.com/sites/usanetwork/files/modernfamily_gallery_jay-1.jpg",
        person: Person.find_by(first_name: "Jay")
      }
    ])

  User.create([
    {username: "mannyman", first_name: "Manny", last_name: "Delgado", password: "pw", person: Person.find_by(first_name: "Manny")}
    ])
