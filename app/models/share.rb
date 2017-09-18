class Share < ActiveRecord::Base
	belongs_to :note
	validates :note_id, presence: true
end
