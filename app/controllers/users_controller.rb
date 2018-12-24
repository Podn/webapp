class UsersController < ApplicationController
    before_action :authenticate_user, :except => [:create, :create_editor, :editor_signup]

    def create
        params[:user_type] = "business"
        @user = User.new(user_params)
        user_saved = @user.save
        if !user_saved
            redirect_to '/signup', flash: {notice: "Error creating account, please try again.\n#{formatErrors(@user.errors.messages)}"} 
            return
        end
        session[:user_id] = @user.id
        redirect_to action: :information
    end

    def editor_signup
    end

    def editor_review
    end

    def create_editor
        params[:user_type] = "editor"
        @user = User.new(user_params)
        user_saved = @user.save
        if !user_saved
            redirect_to '/editor/signup', flash: {notice: "Error creating account, please try again.\n#{formatErrors(@user.errors.messages)}"} 
            return
        end
        session[:user_id] = @user.id
        redirect_to action: :editor_review
    end

    def information
    end


    def user_params
        params.permit(:first_name, :last_name, :email, :user_type, :editing_description, :previous_work , :password, :password_confirmation)
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
