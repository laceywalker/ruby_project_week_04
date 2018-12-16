require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('./models/*')



get '/owners' do
  @owners = Owner.all()
  erb ( :"owner/index" )
end

get '/owners/:id' do
  erb(:"owner/show")
end
