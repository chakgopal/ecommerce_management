# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
root = Category.create name: 'Men'
root1 = Category.create name: 'Women'
root2 = Category.create name: 'Chirldren'
root3 = Category.create name: 'Other'
#  subcategories
men_cat = root.children.create name: 'clothing'
women_cat = root1.children.create name: 'clothing'
chirldren_cat = root2.children.create name: 'clothing'
# Men categories
men_cat.children.create name: 'pants'
men_cat.children.create name: 'shirt'
men_cat.children.create name: 't-shirt'
# Women subcategories
women_cat.children.create name: 'pants'
women_cat.children.create name: 'shirt'
women_cat.children.create name: 't-shirt'
# Chirldren subcategories
chirldren_cat.children.create name: 'pants'
chirldren_cat.children.create name: 'shirt'
chirldren_cat.children.create name: 't-shirt'