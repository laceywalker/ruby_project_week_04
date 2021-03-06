require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
also_reload('./models/*')
require('pry')


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

post '/animals/:id/adopt' do      #new up animal 
  animal = Animal.find(params['id'])
  animal.owner_id = params['owner_id'].to_i
  animal.available = params['available']
  animal.update
  redirect to "/animals"
end



# get '/animals/search/for/animal' do
#   erb(:"/animal/search")
# end

# post 'animals/search/for/animal' do
#   @found_animal = Animal.search_animal(params)
# end
