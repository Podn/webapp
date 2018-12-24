class MainController < ApplicationController
  before_action :authenticate_user, :except => [:index, :login, :login_attempt, :logout, :signup, :editor, :apply]
    def index
      @current_user = current_user
    end

    def editor
        @current_user = current_user
    end

    def signup
    end

    def login
    end

    def login_attempt
        authorized_user = User.authenticate(params[:email],params[:password])
        if authorized_user
            session[:user_id] = authorized_user.id
            logger.warn authorized_user.to_json
            if authorized_user.user_type == "editor"
                redirect_to('/editor/review')
            else
                redirect_to(:action => 'index')
            end
        else
            flash[:notice] = "Invalid Username or Password"
            render "login"
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to :action => 'login'
    end
end
