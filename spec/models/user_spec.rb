require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do 
    it "should create the user when password and password_confirmation mateches" do
      @user = User.new(first_name:'Edwin', last_name: 'Ly', email:'bob@bob.com', password:'123456', password_confirmation:'123456')
      @user.save
      expect(User.where("email = 'bob@bob.com'")).to be_present
    end
    it "should not create the user when password and password_confirmation don't mateches" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'123456', password_confirmation:'123455')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "email must be unique" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'123456', password_confirmation:'123456')
      @user.save
      @userTest = User.new(first_name:'Shan', last_name: 'Jac', email:'bob@BOB.com', password:'123456', password_confirmation:'123456')
      @userTest.save
      expect(@userTest.errors.full_messages.first).to eql("Email has already been taken")
    end

    it "should have minimum 6 characters in password" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'12345', password_confirmation:'12345')
      @user.save
      expect(@user.errors.full_messages.first).to eql("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should return the correct user when email and password are correct" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'123456', password_confirmation:'123456')
      @user.save
      @userTest = User.authenticate_with_credentials("bob@bob.com","123456")
      expect(@userTest).to eql(@user)
    end

    it "should return nil when email or password is incorrect" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'123456', password_confirmation:'123456')
      @user.save
      @userTest = User.authenticate_with_credentials("bob@bob.com","1234567")
      expect(@userTest).to be_nil
    end

    it "should return the correct user when email has extra whitespace at the begnning or end" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'123456', password_confirmation:'123456')
      @user.save
      @userTest = User.authenticate_with_credentials(" bob@bob.com ","123456")
      expect(@userTest).to eql(@user)
    end

    it "should return the correct user when user types in the wrong case for the email" do
      @user = User.new(first_name:'Jason', last_name: 'Lee', email:'bob@bob.com', password:'123456', password_confirmation:'123456')
      @user.save
      @userTest = User.authenticate_with_credentials("bOb@boB.com","123456")
      expect(@userTest).to eql(@user)
    end
  end
end