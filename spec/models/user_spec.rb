require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it { should respond_to :phone_number }
  it { should validate_presence_of(:phone_number) }
  it { should validate_uniqueness_of(:phone_number) }

  it "should create successfully" do
  	user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret', phone_number: "123")
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
