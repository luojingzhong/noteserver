class NotebooksController < ApplicationController
    before_action :signed_in_user

    def create
        @book = current_user.notebooks.build(notebook_params)
        @book.save
        respond_to do |format|
            format.js
        end
    end

    def update
        @book = current_user.notebooks.find_by(id:params[:notebook][:id])
        @book.name = params[:notebook][:name]
        @book.save
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

    private
        def notebook_params
            params.require(:notebook).permit(:name)
        end
end