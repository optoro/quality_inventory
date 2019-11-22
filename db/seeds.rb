# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seeds = YAML.load_file('db/seeds.yml')

# SEED PRODUCTS
seeds['products'].each do |product|
  Product.where(product).first_or_create!
end

# SEED UNITS
seeds['units'].each do |unit|
  Unit.where(unit).first_or_create!
end
