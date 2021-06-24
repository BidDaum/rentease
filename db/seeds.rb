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


guillaume = User.new(password: "123456", email: "guillaume@rentease.com", name: "Fraud", first_name: "Guillaume")
william = User.new(password: "123456", email: "william@rentease.com", name: "Allin", first_name: "William")
brice = User.new(password: "123456", email: "brice@rentease.com", name: "Levasseur", first_name: "Brice")
adrien = User.new(password: "123456", email: "adrien@rentease.com", name: "Bellamy", first_name: "Adrien")
id= "https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623431434/5xmmcdrbhygi0v5xsozgc3czxwec.jpg"
idmod = "https://res.cloudinary.com/dx3uj4h7t/image/upload/l_DERFER-removebg-preview_xmllht/v1623431434/5xmmcdrbhygi0v5xsozgc3czxwec.jpg"
william.save!
=begin file = URI.open(id)
apply1 = Apply.new(title: "Dossier de William")
apply1.user = william
apply1.save!
rentfile1 = Rentfile.new(name: "Carte d'identité")
rentfile1.apply = apply1
rentfile1.photos.attach(io: file, filename: '5xmmcdrbhygi0v5xsozgc3czxwec.jpg', content_type: 'image/jpg')
rentfile1.save!

file = URI.open("https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623175270/bpgydu2vl3elmjz9hwv4x7a58yga.jpg")
rentfile2 = Rentfile.new(name: "Bulletins de salaire")
rentfile2.apply = apply1
rentfile2.photos.attach(io: file, filename: 'bpgydu2vl3elmjz9hwv4x7a58yga.jpg', content_type: 'image/jpg')
file = URI.open("https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623175262/zkh9v341288sssn15nd2dkwedm3j.jpg")
rentfile2.photos.attach(io: file, filename: 'zkh9v341288sssn15nd2dkwedm3j.jpg', content_type: 'image/jpg')
file = URI.open("https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623175270/bpgydu2vl3elmjz9hwv4x7a58yga.jpg")
rentfile2.photos.attach(io: file, filename: 'bpgydu2vl3elmjz9hwv4x7a58yga.jpg', content_type: 'image/jpg')
rentfile2.save!


puts "1 SEED FOR william@rentease.com"

apply2 = Apply.new(title: "Dossier de Brice!")
apply2.user = brice
apply1.save!

id2 ="https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623348412/le161zsntxk8jnu8hkran3iu9nx6.jpg"
file = URI.open(id2)

rentfile1 = Rentfile.new(name: "Carte d'identité")
rentfile1.apply = apply1
rentfile1.photos.attach(io: file, filename: '5xmmcdrbhygi0v5xsozgc3czxwec.jpg', content_type: 'image/jpg')
rentfile1.save!

file = URI.open("https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623175270/bpgydu2vl3elmjz9hwv4x7a58yga.jpg")
rentfile2 = Rentfile.new(name: "Bulletins de salaire")
rentfile2.apply = apply1
rentfile2.photos.attach(io: file, filename: 'bpgydu2vl3elmjz9hwv4x7a58yga.jpg', content_type: 'image/jpg')
file = URI.open("https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623175262/zkh9v341288sssn15nd2dkwedm3j.jpg")
rentfile2.photos.attach(io: file, filename: 'zkh9v341288sssn15nd2dkwedm3j.jpg', content_type: 'image/jpg')
file = URI.open("https://res.cloudinary.com/dx3uj4h7t/image/upload/v1623175270/bpgydu2vl3elmjz9hwv4x7a58yga.jpg")
rentfile2.photos.attach(io: file, filename: 'bpgydu2vl3elmjz9hwv4x7a58yga.jpg', content_type: 'image/jpg')
rentfile2.save!

puts "1 SEED for brice@rentease.com"
=end
puts "FINISHED"
