require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid when all parameters are provided' do
      user = User.new(
        first_name: 'User',
        last_name: 'Name',
        email: 'email@email.com',
        password: '123456abc',
        password_confirmation: '123456abc'
      )
      expect(user).to be_valid
    end

    it 'is invalid when the password is missing' do
      user = User.new(
        first_name: 'User',
        last_name: 'Name',
        email: 'email@email.com',
        password: nil,
        password_confirmation: '123456abc'
    )
      expect(user).not_to be_valid
    end

    it 'is invalid when the password and password confirmation are missing' do
      user = User.new(
        first_name: 'User',
        last_name: 'Name',
        email: 'email@email.com',
        password: nil,
        password_confirmation: nil
    )
      expect(user).not_to be_valid
    end

    it 'is invalid when the password and password confirmation don\'t match' do
      user = User.new(
        first_name: 'User',
        last_name: 'Name',
        email: 'email@email.com',
        password: '123456abc',
        password_confirmation: '123456abcd'
    )
      expect(user).not_to be_valid
    end

    it 'is invalid when the email already exists' do
      user1 = User.create(
        first_name: 'User',
        last_name: 'Name',
        email: 'email@email.com',
        password: '123456abc',
        password_confirmation: '123456abc'
      )     

      user2 = User.new(
        first_name: 'User',
        last_name: 'Name',
        email: 'EMAIL@email.com',
        password: '123456abc',
        password_confirmation: '123456abc'
      )
      expect(user2).not_to be_valid
    end

    it 'is invalid when the email, first_name, or last_name are missing' do
      user = User.new(
      last_name: 'Name',
      email: 'email@email.com',
      password: '123456abc',
      password_confirmation: '123456abc'
    )
      expect(user).not_to be_valid
    end

    it 'is invalid when the password is too short, less than 8 chars' do
      user = User.new(
        first_name: 'User',
        last_name: 'Name',
        email: 'email@email.com',
        password: '1234567',
        password_confirmation: '1234567'
    )
      expect(user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns an instance of the user when a valid email and password are entered' do
      user = User.create!(
        first_name: 'Daryl',
        last_name: 'Bucket',
        email: 'realUser@email.com',
        password: '123456abc',
        password_confirmation: '123456abc'
      )

      result = User.authenticate_with_credentials('realUser@email.com', '123456abc')

      expect(result).to eq(user)
    end

    it 'returns user when email has leading/trailing spaces' do
      user = User.create!(
        first_name: 'Daryl',
        last_name: 'Bucket',
        email: 'realUser@email.com',
        password: '123456abc',
        password_confirmation: '123456abc'
      )

      result = User.authenticate_with_credentials('   realUser@email.com   ', '123456abc')

      expect(result).to eq(user)
    end
    it 'returns user when email case is different' do
      user = User.create!(
        first_name: 'Daryl',
        last_name: 'Bucket',
        email: 'DIFFERENTEMAIL@EMAIL.COM',
        password: '123456abc',
        password_confirmation: '123456abc'
      )

      result = User.authenticate_with_credentials('differentemail@email.com', '123456abc')

      expect(result).to eq(user)

    end
  end
end
