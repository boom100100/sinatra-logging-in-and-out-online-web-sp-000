require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find(params[:username])
    #if @user
      session[:user_id] = @user.id
      redirect to '/account'
    #else
    #  "Sign in failed. You will be redirected in 5 seconds."
    #  sleep(5)
    #  redirect to '/'
    #end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do

  end


end
