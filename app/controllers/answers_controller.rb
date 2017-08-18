#show all comments associated with the given answer.
get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments
  erb :'answers/comments'
end

post '/answers/:id/' do

end
