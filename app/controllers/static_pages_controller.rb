class StaticPagesController < ApplicationController
    
    def show
        @users = User.all
        if session[:remember_token] != nil || session[:user_id] != nil
            flash.now[:success] = "Welcome to the Private Club Hacking!"         
        elsif 
            flash.now[:danger] = "Vous n'avez pas accés a cette page!"
            redirect_to root_path
        end

    end
end
