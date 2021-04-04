# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RequestCategory.create(:name => '交際費')
RequestCategory.create(:name => '食費')
RequestCategory.create(:name => '嗜好品購入費')
RequestCategory.create(:name => '生活費')