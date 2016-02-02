require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
  	@user = User.create!(name: "John Doe", email: "testemail@gmail.com", password: "password")
  end

  describe "creation" do
  	it "should have have one item created after being created" do
  	  expect(User.all.count).to eq(1)
  	end	
  end

  describe "validations" do
  	it "should not let user be created without email address" do
  	  @user.email = nil
  	  expect(@user).to_not be_valid
  	end
  end
end
