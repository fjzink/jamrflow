#show all comments associated with the given answer.
get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments
  @question = @answer.question
  erb :'answers/comments'
end

post '/answers/:id' do
  answer = Answer.find(params[:id])
  question = Question.find(answer.question.id)

  if logged_in?
    Comment.Create(content: params[:comment], commentable_type: Answer, commenter_id: session[:user_id], commentable_id: answer.id)
  else
    redirect '/login'
  end
end
