require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('./models/*')



get '/owners' do
  @owners = Owner.all()
  erb ( :"owner/index" )
end

get '/owners/new' do
  @owners = Owner.all
  erb(:"owner/new")
end


get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb( :"owner/show" )
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to '/owners'
end

post '/owners/:id/delete' do          #would need to call method before which UNADOPTS pets then delete
  Owner.delete(params[:id])
  redirect to '/owners'
end

# post '/animals/:id/adopt' do
#   animal = Animal.find(params['id'])
#   animal.owner_id = params['owner_id'].to_i
#   animal.update
#   redirect to "/animals"
# end




# get '/owners/:id/edit' do
#   @owner = Owner.find(params['id'].to_i)
#   erb(:"owner/:id/edit")
# end
#
# post '/animals/:id/edit' do
#   animal = Animal.find(params['id'])
#   animal.owner_id = params['owner_id'].to_i
#   animal.update
#   redirect to "/animals"
# end
