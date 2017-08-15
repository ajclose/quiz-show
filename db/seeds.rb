# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'admin', password: 'password', admin: true)

seinfeld = Quiz.create!(title: 'Seinfeld Trivia', description: 'How well do you know Seinfeld?', published: false)
Quiz.create!(title: 'unpublished quiz', description: 'unfinished quiz', published: false)

question_one = Question.create!(quiz_id: seinfeld.id, body: "What is Kramer's first name?")
Answer.create!(question_id: question_one.id, body: "Cosmo", correct: true)
Answer.create!(question_id: question_one.id, body: "Jerry", correct: false)
Answer.create!(question_id: question_one.id, body: "George", correct: false)
Answer.create!(question_id: question_one.id, body: "Bob", correct: false)

question_two = Question.create!(quiz_id: seinfeld.id, body: "What is Jerry's profession?")
Answer.create!(question_id: question_two.id, body: "Comedian", correct: true)
Answer.create!(question_id: question_two.id, body: "Importer/exporter", correct: false)
Answer.create!(question_id: question_two.id, body: "Lawyer", correct: false)
Answer.create!(question_id: question_two.id, body: "VP of Kramerica Industries", correct: false)

question_three = Question.create!(quiz_id: seinfeld.id, body: "What was Jerry's father president of?")
Answer.create!(question_id: question_three.id, body: "Del Boca Vista", correct: true)
Answer.create!(question_id: question_three.id, body: "The United States", correct: false)
Answer.create!(question_id: question_three.id, body: "Kramerica Industries", correct: false)
Answer.create!(question_id: question_three.id, body: "NBC", correct: false)

question_four = Question.create!(quiz_id: seinfeld.id, body: "What was David Puddy's profession?")
Answer.create!(question_id: question_four.id, body: "Mechanic", correct: true)
Answer.create!(question_id: question_four.id, body: "Architect", correct: false)
Answer.create!(question_id: question_four.id, body: "CFO of Kramerica Industries", correct: false)
Answer.create!(question_id: question_four.id, body: "Owner of Kenny Roger's Chicken", correct: false)
