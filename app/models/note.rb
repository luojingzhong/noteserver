class Note < ActiveRecord::Base
	belongs_to :notebook
	belongs_to :user
	validates :title, presence: true, length: { maximum: 20 }
end
