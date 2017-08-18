get '/questions' do
  @questions = Question.all
  erb :'index'
end

post '/questions/:id/upvote' do
  # content_type :json
  question = Question.find(params[:id])
  question.votes.create(value: 1)
  redirect "/questions/#{question.id}/answers"
end

post '/questions/:id/downvote' do
  # content_type :json
  question = Question.find(params[:id])
  question.votes.create(value: -1)
  redirect "/questions/#{question.id}/answers"
end

post '/questions/:id/comments' do
  # content_type :json
  question = Question.find(params[:id])
  redirect "/questions/#{question.id}/comments"
end

get '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'/questions/show'
end

get '/questions/:id/comments' do
  erb :'/questions/comments'
end