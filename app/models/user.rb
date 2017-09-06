class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true, 
                     length: { maximum: 30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      format: { with: VALID_EMAIL_REGEX, message: "格式不正确" },
                      uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6}
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    has_many :notebooks, dependent: :destroy
    has_many :notes

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt token
        Digest::SHA1::hexdigest(token.to_s)
    end

    private
        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
end
