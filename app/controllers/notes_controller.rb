class NotesController < ApplicationController
    before_action :signed_in_user
    def index
        @book_id = params[:notebook_id]
        @notes = Notebook.find_by(id: params[:notebook_id]).notes.order("updated_at desc")
        respond_to do |format|
            format.js
        end	
    end

    def create
        @note = current_user.notes.build(note_params)
        @note.save
        respond_to do |format|
            format.js
        end
    end

    def edit
        @note = current_user.notes.find_by(id: params[:id])
        respond_to do |format|
            format.js
        end
    end

    def update
        @note = current_user.notes.find_by(id: params[:note][:id])
        @note.title = params[:note][:title]
        @note.content = params[:note][:content]
        @note.save
        respond_to do |format|
            format.js
        end
    end

    def destroy
        @note = current_user.notes.find_by(id: params[:id])
        @note.destroy unless @note.nil?
        respond_to do |format|
            format.js
        end
    end

    def search
        @notes = current_user.notes.where("title like '%#{params[:note][:title]}%'")
        respond_to do |format|
            format.js
        end
    end

    private
        def note_params
            params.require(:note).permit(:title,:notebook_id)
        end
end