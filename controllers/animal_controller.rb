require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
also_reload('./models/*')


# index
get '/animals' do
  @animals = Animal.all
  erb( :"animal/index" )
end

get '/animals/:id/adopt' do
  erb( :"animal/new" )
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb( :"animal/show" )
end

post '/animals/:id' do
  Animal.new(params).update
  redirect to '/animals'
end
