require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have miminum 5 length of password' do
      @user = User.new(email: "test@gmail.com", password: "1234", password_confirmation: "1234", name: "anything", lastName: "anything")
      expect(@user).to_not be_valid
    end

    it 'should have unique email address' do
      @user = User.new(email: "test@gmail.com", password: "12345", password_confirmation: "12345", name: "anything", lastName: "anything")
      @user.save

      @user = User.new(email: "test@gmail.com", password: "12345", password_confirmation: "12345", name: "anything", lastName: "anything")
      expect(@user).to_not be_valid
    end

    it 'should give false when the password does not match with password confirmation' do
      @user = User.new(email: "test@gmail.com", password: "12345", password_confirmation: "54321", name: "anything", lastName: "anything")
      expect(@user.passwordConfirmation?).to be(false)
    end

    it 'should give true when the password matches with password confirmation' do
      @user = User.new(email: "test@gmail.com", password: "12345", password_confirmation: "12345", name: "anything", lastName: "anything")
      expect(@user.passwordConfirmation?).to be(true)
    end

    it 'is not valid without a email' do
      @user = User.create(email: nil, name: "anything", lastName: "anything", password: "12345", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a First name' do
      @user = User.create(email: "test@gmail.com", name: nil, lastName: "anything", password: "12345", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a Last name' do
      @user = User.create(email: "test@gmail.com", name: "anything", lastName: nil, password: "12345", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'is not valid without a password' do
      @user = User.create(email: "test@gmail.com", name: "anything", lastName: "anything", password: nil, password_confirmation: "12345")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      @user = User.create(email: "test@gmail.com", name: "anything", lastName: "anything", password: "12345", password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'should return true when password matches and user has the same email address' do
      @user1 = User.create(email: "test@gmail.com", name: "anything", lastName: "anything", password: "12345", password_confirmation: "12345")
      @user2 = User.authenticate_with_credentials("test@gmail.com")

      expect(@user1).to eq @user2
    end

    it 'should return true when password matches and the user email contains spaces' do
      @user1 = User.create(email: "test@gmail.com", name: "anything", lastName: "anything", password: "12345", password_confirmation: "12345")
      @user2 = User.authenticate_with_credentials(" test@gmail.com ")

      expect(@user1).to eq @user2
    end

    it 'should return true when password matches and the user email has uppercase in it' do
      @user1 = User.create(email: "test@gmail.com", name: "anything", lastName: "anything", password: "12345", password_confirmation: "12345")
      @user2 = User.authenticate_with_credentials("TEST@gmail.com")

      expect(@user1).to eq @user2      
    end
  end
end
