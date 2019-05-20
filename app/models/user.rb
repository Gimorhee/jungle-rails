class User < ActiveRecord::Base
    validates :email, uniqueness: true, presence: true
    validates :password, length: {minimum: 5}, presence: true
    validates :password_confirmation, length: {minimum: 5}, presence: true
    validates :name, presence: true
    validates :lastName, presence: true

    has_secure_password
    has_many :reviews

    def self.authenticate_with_credentials(email)
        @user = User.find_by(email: email.downcase.strip)
        if (@user && @user.passwordConfirmation?)
          @user
        else
            nil
        end
    end

    def passwordConfirmation?
        self.password == self.password_confirmation
    end

end
