require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('./models/*')



get '/owners' do
  @owners = Owner.all()
  erb ( :"owner/index" )
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb( :"owner/show" )
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owner/edit")
end

# get '/owners/:id/delete' do
#   redirect to '/owners'
# end
#
# post '/owners/:id/delete' do
#   owner = Owner.find(params[:id])
#   owner.destroy
#   redirect to '/owners'
# end
