require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
also_reload('./models/*')
require('pry')

# index
get '/animals' do
  @animals = Animal.all
  erb( :"animal/index" )
end

get '/animals/new' do
  @animals = Animal.all
  erb(:"animal/new")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id].to_i)
  erb( :"animal/show" )
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/animals'
end

get '/animals/:id/adopt' do
  @animal = Animal.find(params['id'].to_i)
  @owners = Owner.all
  erb(:"animal/adopt")
end

post '/animals/:id/adopt' do
  animal = Animal.find(params['id'])
  animal.owner_id = params['owner_id'].to_i
  # animal = Animal.new(params)
  new_animal.update
  redirect to "/animals"
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/animals/#{params['id']}"
end
