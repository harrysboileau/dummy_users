get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/create_user' do
  @user = User.create(params[:user])
  redirect to '/'
end
