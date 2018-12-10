class User < ActiveRecord::Base

    attr_accessor :password
    attr_accessor :password_confirmation

    before_save :encrypt_password
    after_save :clear_password

    EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password, :confirmation => true # password_confirmation attr

    def create
        User.create(params[:user])
    end

    def self.authenticate(email="", login_password="")
        user = User.find_by_email(email)
        if user && user.match_password(login_password)
          return user
        end
      return false
    end

    private

    def match_password(login_password="")
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
    end

    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      end
    end

    def clear_password
      self.password = nil
    end
end
