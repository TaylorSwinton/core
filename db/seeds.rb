# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
    taylor = User.create(name: 'Taylor', password: 'password', email: 'taylor@email.com')
    sophie = User.create(name: 'Sophie', password: 'password', email: 'sophie@email.com')
    annie = User.create(name: 'Annie', password: 'password', email: 'annie@email.com')
    stan = User.create(name: 'Stan', password: 'password', email: 'stan@email.com')
# Courses
    buildingStrength = Course.create(title: 'Building Strength', description: 'My Description', category: 'Workout', time: 20)
    buildingTheMind = Course.create(title: 'Building The Mind', description: 'My description', category: 'Journaling')
    buildingSpirit = Course.create(title: 'Building Spirit', description: 'My description', category: 'Meditation')
# Steps
    run = Step.create(name: 'Run', description: 'Run til tired', user_id: taylor.id, course_id: buildingStrength.id)
    jumpingJacks = Step.create(name: 'Jumping Jacks', description: '30 Jumping Jacks', user_id: taylor.id, course_id: buildingStrength.id)
