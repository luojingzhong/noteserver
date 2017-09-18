class UsersController < ApplicationController
    before_action :signed_in_user, only: [:edit,:show,:notes]
    layout false,only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
        @user = User.find_by(id:params[:id])
    end

    def notes
        @notes = current_user.notes.order('updated_at DESC')
        respond_to do |format|
            format.js
        end
    end

    private
        def user_params
            params.require(:user).permit(:name,:email,:password,:password_confirmation)
        end
end