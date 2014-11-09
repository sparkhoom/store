require 'rails_helper'

RSpec.describe User, :type => :model do

  it "should create successfully" do
	user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret')
	user.skip_confirmation!
  	expect( user.save).to eq true
  end 

  it "generate token" do
  	user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret')
  	user.skip_confirmation!
  	expect(user.authentication_token).to eq nil
  	user.save
  	expect(user.authentication_token) != nil
  end

  it "should rest token" do
  	user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret')
  	user.skip_confirmation!
  	user.save
  	expect(user.authentication_token) != user.reset_authentication_token!
  end

  
end
