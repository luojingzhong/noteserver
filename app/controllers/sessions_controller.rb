class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email:params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            sign_in user
            redirect_back_or users_path
        else
            flash[:notice] = "邮箱或密码错误"
            redirect_to root_path
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end
end