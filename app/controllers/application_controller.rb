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
    if @user
      session[:user_id] = @user.id
    #@user = Helpers.current_user(session)
    #if @user

      redirect to '/account'
    else
    end
    #else
    #  "Sign in failed. You will be redirected in 5 seconds."
    #  sleep(5)
    #  redirect to '/'
    #end
  end

  get '/account' do
    if User.find(session[:user_id])
      erb :account
    else
      "You must log in before viewing this page."
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
