require 'sinatra'

configure { set :server, :puma }

get '/' do
  erb :index, locals: { title: "Hello World" }
end

get '/login' do
  logger.info "TODO: SCAN FOR A PIF/CAC CARD"
  logger.info params

  redirect to('/profile')
end

get '/profile' do
  erb :profile, locals: {
    title: "Profile Page",
    user: { certs:[], name:"Test User", email:"abc123@gsa.gov" }
  }
end
