class NotebooksController < ApplicationController
    before_action :signed_in_user

    def create
        @book = current_user.notebooks.create(name: params[:notebook][:name])
        respond_to do |format|
            format.js
        end
    end
end