class MainController < ApplicationController
  before_action :authenticate_user, :except => [:index, :login, :login_attempt, :logout, :signup]
  def index
    logger.warn current_user.to_json
    @current_user = current_user
    logger.warn @current_user.to_json
  end

  def signup
  end

    def login
    end

    def login_attempt
        authorized_user = User.authenticate(params[:email],params[:password])
        if authorized_user
            session[:user_id] = authorized_user.id
            redirect_to(:action => 'index')

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
