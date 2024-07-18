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
    it 'is not valid without a password confirmation given' do
      user = User.new(name: 'Bob Green', email: 'bob@bob.com', password: 'password')
      expect(user).not_to be_valid
    end
    it 'is not valid when password is under 6 characters' do
      user = User.new(name: 'Bob Green', email: 'bob@bob.com', password: 'pass', password_confirmation: 'pass')
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
    describe '.authenticate_with_credentials' do
      let! (:user) {User.create(name: 'Bob Green', email: 'bob@bob.com', password: 'password', password_confirmation: 'password')}

      context 'when the credentials are valid' do
        it 'returns the user' do
          authenticated_user = User.authenticate_with_credentials('bob@bob.com', 'password')
          expect(authenticated_user).to eq(user)
        end
      end

      context 'when credentials are invalid' do
        it 'returns nil when email is incorrect' do
          authenticated_user = User.authenticate_with_credentials('bob@bobby.com', 'password')
          expect(authenticated_user).to be_nil
        end
        it 'returns nil when password is incorrect' do
          authenticated_user = User.authenticate_with_credentials('bob@bob.com', 'password1')
          expect(authenticated_user).to be_nil
        end
      end

      context 'when email has trailing spaces' do
        it 'authenticates the user successfully' do
          authenticated_user = User.authenticate_with_credentials(' bob@bob.com ', 'password')
          expect(authenticated_user).to eq(user)
        end
      end

      context 'when email has a mix of cases' do
        it 'authenticates the user successfully' do
          authenticated_user = User.authenticate_with_credentials('Bob@Bob.com', 'password')
          expect(authenticated_user).to eq(user)
        end
      end
  end
end
