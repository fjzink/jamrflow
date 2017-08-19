votes = [1, -1]

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

20.times do
  username = Faker::Cat.name.downcase + '_' + Faker::Pokemon.name.downcase
  User.create(username: username , email: Faker::Internet.email(username))
end

20.times do
  Question.create(title: Faker::RickAndMorty.quote, content: Faker::RuPaul.quote, questioner_id: User.all.sample.id)
  Answer.create(content: Faker::ChuckNorris.fact, question_id: Question.all.sample.id, answerer_id: User.all.sample.id)
  Vote.create(votable_type: Question, votable_id: Question.all.sample.id, voter_id: User.all.sample.id, value: votes.sample)
  Vote.create(votable_type: Answer, votable_id: Question.all.sample.id, voter_id: User.all.sample.id, value: votes.sample)
  Comment.create(commentable_type: Question, commentable_id: Question.all.sample.id, commenter_id: User.all.sample.id, content: Faker::MostInterestingManInTheWorld.quote)
  Comment.create(commentable_type: Answer, commentable_id: Question.all.sample.id, commenter_id: User.all.sample.id, content: Faker::MostInterestingManInTheWorld.quote)
  Vote.create(votable_type: Question, votable_id: Question.all.sample.id, voter_id: User.all.sample.id, value: 1)
  Vote.create(votable_type: Answer, votable_id: Answer.all.sample.id, voter_id: User.all.sample.id, value: 1)
end
