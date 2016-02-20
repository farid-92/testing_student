# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'admin@gmail.com', password: '12345678')


  test = Test.create!(name: 'Ruby on Rails cw#1')

question1 = Question.create!(content: '2 + 2',test_id: test.id)

answers = []
  3.times do
   random = rand(10..20)
   answers.push Answer.create!(content: random, question_id: question1.id,correct: false )
  end
  answers.push Answer.create!(content: 4, question_id:question1.id,correct: true )

