# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Destroy all records in the database before creating new data
Question.destroy_all

#To access FAker we need to add the gem to Gemfile and run: bundle

200.times do
    created_at = Faker::Date.backward(days: 365 * 5)

    Question.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at
    )
end

questions = Question.all

puts Cowsay.say("Generated #{questions.count} questions", :frogs)

#To run this file we use command: rails db:seed



