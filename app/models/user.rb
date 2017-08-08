class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: { message: "用户名不能为空" }, 
                     length: { maximum: 30, message: "用户名长度不能超过30" }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: { message: "邮箱地址不能为空" },
                      format: { with: VALID_EMAIL_REGEX, message: "邮箱格式不正确" },
                      uniqueness: { case_sensitive: false, message: "邮箱已被使用" }
    validates :password, length: { minimum: 6 }
    before_save { self.email = email.downcase }
    before_create :create_remember_token

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
