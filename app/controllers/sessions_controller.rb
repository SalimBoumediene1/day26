class SessionsController < ApplicationController
    def new
    end
  
    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : (cookies.delete(:user_id) && cookies.delete(:remember_token))
        redirect_to club_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  
    def destroy
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
      session.delete(:user_id)
      session[:user_id] = nil
      redirect_to root_url
    end

    private
    #methode qui nous permet de d'implementer le session[:id] avec l'id du user
    def log_in(user)
        session[:user_id] = user.id
    end    

    # return true si l'utilisateur est connecté
    def logged_in?
        !session[:user_id].nil?
    end

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token    
    end
    
end
