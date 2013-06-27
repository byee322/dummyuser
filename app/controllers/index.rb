enable :sessions

get '/' do
	erb :index
end

post '/login' do 
	p params
	p @email = params[:user][:email]
	p @password = params[:user][:password]
	p user = User.find_by_email(@email)

	if user && user.authenticate(@password)
		session[:user_id] = user.id
		redirect '/user_page'
	else
		redirect '/'
	end
end

get '/user_page' do
	if session[:user_id]  
		@current_user = User.find(session[:user_id])
		erb :user_page
	else
		redirect "/"
	end
end

get '/create_user' do 
	erb :create_user
end

post '/create' do 
	@email = params[:user][:email]
	@password = params[:user][:password]
	User.create(params[:user])
	redirect '/'
end
