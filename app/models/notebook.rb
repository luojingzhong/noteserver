class Notebook < ActiveRecord::Base
    validates :name, presence: true,
                     length: { maximum: 10 }
    validates :user_id, presence: true
    belongs_to :user
    has_many :notes,dependent: :destroy
end
