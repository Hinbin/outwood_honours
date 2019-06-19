# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Awarder.create(name: 'Learning Manager')
Category.create(name: 'Charity')
Badge.create!(name: 'Charity Level 1', awarder: Awarder.find(1), category: Category.find(1), criteria: 'Do some charity')