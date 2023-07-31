# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# Create fake exercises
15.times do
  Exercise.create!(
    exercise_name: Faker::Sports::Football.position,
    image: "https://i.pinimg.com/564x/43/da/17/43da173d622219639a4334e1e8315e0c.jpg",
    exercise_type: Faker::Lorem.word,
    body_part: Faker::Lorem.word,
    duration: Faker::Number.between(from: 10, to: 60),
    sets: Faker::Number.between(from: 1, to: 5),
    reps: Faker::Number.between(from: 5, to: 20),
    calories_burned: Faker::Number.between(from: 50, to: 500),
    status: [true, false].sample
  )
  puts "Completed seeding exercise"
end

# Create fake users
5.times do
  User.create!(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password_digest: BCrypt::Password.create("password"), # Manually hash the password
    age: Faker::Number.between(from: 18, to: 60),
    gender: Faker::Gender.binary_type,
    height: Faker::Number.between(from: 150, to: 200),
    initial_weight: Faker::Number.between(from: 50, to: 100),
    target_weight: Faker::Number.between(from: 45, to: 90)
  )
  puts "Completed seeding user"
end

# Create fake weight tracking data
users = User.all
users.each do |user|
  5.times do
    WeightTracking.create!(
      user_id: user.id,
      weight: Faker::Number.between(from: 50, to: 100),
      date: Faker::Date.backward(days: 30)
    )
    puts "Completed seeding weight tracking"
  end
end

# Create fake workout plans
users.each do |user|
  5.times do
    exercise = Exercise.all.sample
    WorkoutPlan.create!(
      user_id: user.id,
      date: Faker::Date.forward(days: 15),
      exercise_ids: Exercise.pluck(:id).sample(3) # Select 3 random exercise IDs from all available exercises
    )
    puts "Completed seeding workout plan"
  end
end