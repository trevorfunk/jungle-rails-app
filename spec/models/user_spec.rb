require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

   it "is not created with no first name" do
    @user = User.new(
      first_name: nil, 
      last_name: 'Doe', 
      email: 'johndoe@mail.com', 
      password: '123456', 
      password_confirmation: '123456'
      )

      expect(@user).to_not be_valid
     end

     it "is not created with no last name" do
      @user = User.new(
        first_name: 'John', 
        last_name: nil, 
        email: 'johndoe@mail.com', 
        password: '123456', 
        password_confirmation: '123456'
        )

      expect(@user).to_not be_valid
    end

    it "is created with vaild parameters" do
      @user = User.new(
        first_name: 'John', 
        last_name: 'Doe', 
        email: 'johndoe@mail.com', 
        password: '123456', 
        password_confirmation: '123456'
        )

      expect(@user).to be_valid
    end

    it "is not created when password does not match" do
      @user = User.new(
        first_name: 'John', 
        last_name: 'Doe', 
        email: 'johndoe@mail.com', 
        password: '123456', 
        password_confirmation: '654321'
        )

      expect(@user).to_not be_valid
    end

    it "is not created with no email" do
      @user = User.new(
        first_name: 'John', 
        last_name: 'Doe', 
        email: nil, 
        password: '123456', 
        password_confirmation: '123456'
        )

      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
  end
end