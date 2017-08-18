get '/questions' do
  @questions = Question.all
  erb :'index'
end

get '/questions/:id/answers' do
  p params
  @question = Question.find(params[:id])
  p @question
  @answers = @question.answers
  erb :'questions/show'
end

get 'questions/:id/comments' do
  erb :'questions/comments'
end
