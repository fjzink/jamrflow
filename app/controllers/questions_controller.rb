get '/questions' do
  erb :'index'
end

get 'questions/:id/answers' do
  erb :'questions/answers'
end

get 'questions/:id/comments' do
  erb :'questions/'
end
