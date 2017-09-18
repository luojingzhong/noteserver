class SharesController < ApplicationController
	include SharesHelper
	before_action :signed_in_user, only: [:create]
	layout false, only: [:index]
	def create
		note = current_user.notes.find_by(id: params[:note_id])
		puts note
		@share = note.share
		if @share
			@share.update_attributes(title: note.title, content: note.content)
		else
			@share = note.build_share(title: note.title, content: note.content)
			@share.save
		end
		respond_to do |format|
			format.js
		end
	end

	def index
		@shares = Share.order('updated_at DESC').limit(SHOWCOUNT)
	end

	def search
		@shares = Share.where("title like '%#{params[:share][:title]}%'").order('updated_at DESC').limit(SHOWCOUNT)
	end

	def show
		@share = Share.find_by(id:params[:id])
		respond_to do |format|
			format.js
		end
	end

	def collection
		respond_to do |format|
			format.js
		end
	end

	def load_more
		puts params
		render json: Share.where("title like '%#{params[:title]}%'").order('updated_at DESC').limit(SHOWCOUNT).offset(params[:page].to_i * SHOWCOUNT)
	end
end