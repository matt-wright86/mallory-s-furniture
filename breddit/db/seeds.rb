# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first = Post.new     name: "http://www.google.com",
                     description: "a search engine",
                     photo: "http://robohash.org/84Y.png?set=set3&size=150x150"

first.save

second = Post.new    name: "https://tiy-classroom.herokuapp.com/cohorts/7",
                     description: "Don't forget to check in ",
                     photo: "http://robohash.org/EAP.png?set=set3&size=150x150"
second.save
third = Post.new     name: "https://medium.com/@mwright86",
                     description: "A link to Matt's Blog",
                     photo: "http://robohash.org/0ZE.png?set=set3&size=150x150"
third.save

fourth = Post.new    name: "http://youtube.com",
                     description: "it's this place where people go to watch videos.",
                     photo: "http://robohash.org/K31.png?set=set3&size=150x150"
fourth.save

20.times do
  article = Post.new
  article.name = Faker::Internet.url
  article.description = Faker::Lorem.paragraphs(1).join("\n\n")
  article.photo = Faker::Avatar.image
  article.save
end
