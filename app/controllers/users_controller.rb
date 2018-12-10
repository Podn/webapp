class UsersController < ApplicationController
    def new
        @user = User.new 
    end

    def create ()
        logger.debug "here"
        logger.debug user_params
        @user = User.new(user_params)
        user_saved = @user.save
        render :json => {saved: user_saved, user: @user} # don't do msg.to_json
    end


    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
