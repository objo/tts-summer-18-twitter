u = User.find_or_create_by(username: "objo")
u.update_attributes({
  first_name: "Joe",
  last_name:  "O'Brien",
  city:       "Westerville",
  state:      "OH",
  bio:        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
})
u.save!
