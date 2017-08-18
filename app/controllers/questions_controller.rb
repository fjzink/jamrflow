get '/questions' do
  @questions = Question.all
  erb :'index'
end

post '/questions/:id/vote' do
  # content_type :json
  question = Question.find(params[:id])
  question.votes.create(value: 1)
  redirect '/questions'
end

get 'questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

get 'questions/:id/comments' do
  erb :'questions/comments'
end
