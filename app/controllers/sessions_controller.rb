class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email:params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            sign_in user
            redirect_to users_path
        else
            flash[:notice] = "邮箱或密码错误"
            render 'new'
        end
    end

    def destroy
        sign_out
        render 'new'
    end
end