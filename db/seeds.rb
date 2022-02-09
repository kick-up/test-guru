# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

users = User.create!([
  { email: 'darhanbek89@gmail.com'},
  { email: 'bekmuhanbet_kz@mail.ru'},
  { email: 'blog@gmail.com'}
])

categories = Category.create!([
  { title: 'back-end' },
  { title: 'front-end' },
  { title: 'machine learning' },
])

tests = Test.create!([
    { level: 2, title: 'Ruby', category_id: categories[0].id, author_id: users[0].id },
    { level: 3, title: 'Javascript', category_id: categories[1].id, author_id: users[1].id},
    { level: 1, title: 'Python', category_id: categories[2].id, author_id: users[2].id }
])

questions = Question.create!([
  { body: 'Ruby: Question 1', test_id: tests[0].id },
  { body: 'Javascript: Question 2', test_id: tests[1].id },
  { body: 'Python: Question 3', test_id: tests[2].id }
])

Answer.create!([
  { body: 'Ruby: Answer 1', correct: false, question: questions[0] },
  { body: 'Ruby: Answer 1', correct: false, question: questions[0] },
  { body: 'Ruby: Answer 1', correct: false, question: questions[0] },
  { body: 'Ruby: Answer 1', question: questions[0] },
  { body: 'Javascript: Answer 2', question: questions[1] },
  { body: 'Python: Answer 3', question: questions[2] }
])

TestsUser.create!([
  { test: tests[0], user: users[0] }
])


