# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create([{ username: 'Matt' }, { username: 'Manju' }, { username: 'Stacy' }, { username: 'Billy' }, 
{ username: 'John' }, { username: 'Pam' }, { username: 'Jackson' }, { username: 'Star' }])

Poll.create([{ title: 'Healthcare', user_id: 1 }, { title: 'International Relations', user_id: 2 }, { title: 'Social Issues', user_id: 3 }, { title: 'Billy', user_id: 4 }, 
{ title: 'Economics', user_id: 5 }])

Question.create([ {question_text: 'do you like this question', poll_id: 1}, {question_text: 'do you like this question', poll_id: 2}, {question_text: 'do you like this question', poll_id: 3}, {question_text: 'do you hate this question', poll_id: 4}, {question_text: 'do you hate this question', poll_id: 5}, {question_text: 'dogs or cats', poll_id: 1}, {question_text: 'dogs or cats', poll_id: 3}, {question_text: 'dogs or cats', poll_id: 5}])

AnswerChoice.create([{answer_text: 'yes', question_id: 1}, {answer_text: 'no', question_id: 2}, {answer_text: 'yes', question_id: 3}, {answer_text: 'yes', question_id: 4}, {answer_text: 'yes', question_id: 5}])

Response.create([{question_id:1, answer_id: 1, user_id: 1}, {question_id:2, answer_id: 2, user_id: 2},{question_id:1, answer_id: 2, user_id: 3},{question_id:5, answer_id: 2, user_id: 2},{question_id:5, answer_id: 3, user_id: 6},])