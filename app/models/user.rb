class User < ActiveRecord::Base
    validates :email, uniqueness: true, presence: true
    validates :password, length: {minimum: 5}, presence: true
    validates :password_confirmation, length: {minimum: 5}, presence: true
    validates :name, presence: true
    validates :lastName, presence: true

    has_secure_password
    has_many :reviews

    def passwordConfirmation?
        self.password == self.password_confirmation
    end
end
