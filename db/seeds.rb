# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Test User
User.create( email:       "asdf@gmail.com",
             password:    "asdfasdf",
             first_name:  "Test",
             last_name:   "User"
           )

MenuItem.create( name:        "Egg Rolls",
                 description: "Delicious fried vegetable egg rolls x3",
                 price:       3.95,
                 tag_list:    "all, appetizer, entree"
                )

MenuItem.create( name:        "Advocado Egg Rolls",
                 description: "Delicious fried advocado egg rolls x3",
                 price:       4.50,
                 tag_list:    "all, appetizer, entree"
                )
