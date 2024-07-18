require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid when password and password confirmation are the same' do
      user = User.new(name: 'Bob Green', email: 'bob@bob.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
    it 'is not valid without matching password and password confirmation' do
      user = User.new(name: 'Bob Green', email: 'bob@bob.com', password: 'password', password_confirmation: 'password1')
      expect(user).not_to be_valid
    end
    it 'is not valid without a password given' do
      user = User.new(name: 'Bob Green', email: 'bob@bob.com', password_confirmation: 'password1')
      expect(user).not_to be_valid
    end
    it 'is not valid when email already exists in the database' do
      user1 = User.create(name: 'Bob Green', email: 'bob@bob.com', password: 'password', password_confirmation: 'password')
      user2 = User.new(name: 'Bob Greeny', email: 'bob@bob.com', password: 'password1', password_confirmation: 'password1')
      expect(user2).not_to be_valid
    end
    it 'is not valid without a name' do
      user = User.new(email: 'bob@bob.com', password: 'password', password_confirmation: 'password1')
      expect(user).not_to be_valid
    end
    it 'is not valid without an email' do
      user = User.new(name: 'Bob Green', password: 'password', password_confirmation: 'password1')
      expect(user).not_to be_valid
    end
  end
end
