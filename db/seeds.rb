# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Convnetimage.create!(name: 'food', classifier_id: '40036', created_at: 1.year.ago, user: User.third)
Convnetimage.create!(name: 'lawn', classifier_id: '40046', created_at: 1.year.ago, user: User.third)
Convnetimage.create!(name: 'sewer', classifier_id: '39299', created_at: 1.year.ago, user: User.third)
Convnetimage.create!(name: 'agriculture', classifier_id: '39300', created_at: 1.year.ago, user: User.third)
