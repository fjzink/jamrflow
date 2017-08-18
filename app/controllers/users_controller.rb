get '/register' do
  erb :'/users/new'
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    redirect '/questions'
  else
    @errors = user.errors.full_messages
  end
end

