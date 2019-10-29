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
    #session[:user_id] = User.find(params[:username]).id
    #@user = Helpers.current_user(session)
    #if @user

      redirect to '/account'
    #else
    #  "Sign in failed. You will be redirected in 5 seconds."
    #  sleep(5)
    #  redirect to '/'
    #end
  end

  get '/account' do
    if Helpers.is_logged_in?
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
