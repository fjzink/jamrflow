get '/login' do
  logout
  erb :'/sessions/_login'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    login(user)
    redirect '/questions'
  else
    @errors = user.errors.full_messages
    redirect :'/login'
  end
end

delete '/logout' do
  logout
  redirect '/questions'
end
