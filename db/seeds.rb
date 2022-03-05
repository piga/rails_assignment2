# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ogla.destroy_all
User.destroy_all
Prijava.destroy_all

User.create(email: "darko@vulin.eu", password_digest: "secret", ime_i_prezime: "Darko Vulin")

100.times do
  Ogla.create(
    naziv: Faker::Company.catch_phrase,
    opis: Faker::Lorem.paragraph(sentence_count: 3),
    poslodavac: Faker::Company.name,
    email: Faker::Internet.email,
    kategorija: Faker::Company.industry,
    od: Faker::Date.between(from: 3.years.ago, to: Date.today),
    do: Faker::Date.between(from: 1.year.ago, to: 2.months.from_now),
  ) 
end