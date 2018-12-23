class UsersController < ApplicationController
    before_action :authenticate_user, :except => [:create]

    def create ()
        logger.debug "here"
        logger.debug user_params
        @user = User.new(user_params)
        user_saved = @user.save
        if !user_saved
            redirect_to '/signup', flash: {notice: "Error creating account, please try again.\n#{formatErrors(@user.errors.messages)}"} 
            return
        end
        session[:user_id] = @user.id
        redirect_to action: :information
    end

    def information
    end


    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    private
      def formatErrors(errors) 
        values = ""
        errors.each do |field, error|
            errors = error.join(" and ")
            values += "#{field} #{errors}.\n"
        end
        return values
      end
end
