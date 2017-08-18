get '/questions' do
  erb :'index'
end

get 'questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/answers'
end

get 'questions/:id/comments' do
  erb :'questions/'
end
