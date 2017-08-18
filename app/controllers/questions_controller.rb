get '/questions' do
  @questions = Question.all
  erb :'index'
end

post '/questions/:id' do
  # content_type :json
  question = Question.find(params[:id])

  if logged_in?
    if question.votes.find_by(voter_id: session[:user_id])
      redirect "/questions/#{question.id}/answers"
    else
      question.votes.create(value: params[:value].to_i, voter_id: session[:user_id], votable_type: Question, votable_id: question.id)
      redirect "/questions/#{question.id}/answers"
    end
  else
    redirect '/login'
  end
end

post '/questions/:id/comments' do
  # content_type :json
  question = Question.find(params[:id])
  Comment.create(content: params[:comment], commentable_type: Question, commentable_id: params[:id], commenter_id: session[:user_id])
  redirect "/questions/#{question.id}/comments"
end

get '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'/questions/show'
end

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'questions/comments'
end
