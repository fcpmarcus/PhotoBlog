require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
  	@user = User.create!(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password")
  end

  describe "creation" do
  	it "should have have one item created after being created" do
  	  expect(User.all.count).to eq(1)
  	end	
  end

  describe "validations" do
    it "should not let user be created without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  	it "should not let user be created without an email address" do
  	  @user.email = nil
  	  expect(@user).to_not be_valid
  	end
  	it "should not let user be created without a password" do
  	  @user.password = nil
  	  expect(@user).to_not be_valid
  	end
  end

  describe "length validations" do
  	it "should not allow a name longer than 50 characters" do
  	  @user.name = "j" * 51
  	  expect(@user).to_not be_valid
    end
    it "should not allow an email longer than 255 characters" do
      @user.email = "j" * 256
      expect(@user).to_not be_valid
    end
    it "should not allow a password with less than 5 characters" do
      @user.password = "j" * 4
      expect(@user).to_not be_valid
    end
  end

  describe "email validation" do
    it "should accept valid email addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid "#{valid_address.inspect} should be valid"
      end
    end
    it "should not accept invalid email addresses" do
      invalid_addresseses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresseses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid "#{invalid_address.inspect} should be invalid"
      end
    end
  end

  describe "email uniqueness" do
    it "should accept a unique email address" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).to_not be_valid
    end
  end
end
