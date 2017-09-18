class Note < ActiveRecord::Base
	belongs_to :notebook
	belongs_to :user
	has_one :share, dependent: :destroy
	validates :title, presence: true, length: { maximum: 20 }
	validates :notebook_id, presence: true
	validates :user_id, presence: true
end
