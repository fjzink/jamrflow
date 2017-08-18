#show all comments associated with the given answer.
get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = 


  erb :'/partials/_comments'

end
