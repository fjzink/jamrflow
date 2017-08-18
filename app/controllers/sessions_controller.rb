get '/login' do
  logout
  erb :'/sessions/_login'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    login(user)
  else
    @errors = user.errors.full_messages
  end
end

delete '/logout' do
  logout
  redirect '/questions'
end
