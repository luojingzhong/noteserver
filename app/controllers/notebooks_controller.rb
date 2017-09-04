class NotebooksController < ApplicationController
    before_action :signed_in_user

    def create
        @book = current_user.notebooks.create(name: params[:notebook][:name])
        respond_to do |format|
            format.js
        end
    end

    def update
        @book = current_user.notebooks.find_by(id:params[:notebook][:id])
        @book.update_attribute(:name,params[:notebook][:name])
        respond_to do |format|
            format.js
        end
    end

    def destroy
        @book = current_user.notebooks.find_by(id:params[:id])
        @book.destroy!
        respond_to do |format|
            format.js
        end
    end
end