# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating admin...'

require "open-uri"
puts 'We delete the old seeds'
User.destroy_all
Apply.destroy_all


guillaume = User.new(password: "123456", email: "guillaume@rentease.com")
william = User.new(password: "123456", email: "william@rentease.com")
brice = User.new(password: "123456", email: "brice@rentease.com")
adrien = User.new(password: "123456", email: "adrien@rentease.com")
id= "https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623431434/5xmmcdrbhygi0v5xsozgc3czxwec.jpg"
idmod = "https://res.cloudinary.com/dx3uj4h7t/image/upload/l_DERFER-removebg-preview_xmllht/v1623431434/5xmmcdrbhygi0v5xsozgc3czxwec.jpg"

file = URI.open(idmod)
apply1 = Apply.new(title: "Dossier de William")
apply1.user = william
apply1.save!
rentfile1 = Rentfile.new(name: "identité")
rentfile1.apply = apply1
rentfile1.photos.attach(io: file, filename: '5xmmcdrbhygi0v5xsozgc3czxwec.jpg', content_type: 'image/jpg')
rentfile1.save!

puts "FINISHED"