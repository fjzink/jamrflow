#show all comments associated with the given answer.
get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = Comment.all
  @users = User.all
  @commenter = ''
  @comments = @comments.select { |comment| comment.commentable_type == "Answer" }
  @comments = @comments.select { |comment| comment.commentable_id == params[:id] }


  erb :'/comments/comments.erb'

end
