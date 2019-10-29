class Helpers
  def current_user(session)
    User.find(session[:user_id])
  end

  def is_logged_in?(session)
    if session[:user_id] != nil
      return true
    else
      return false
    end
  end
end
