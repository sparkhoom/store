require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do

	before(:all) do
	end

    it "login in successully" do
	    @request.env["devise.mapping"] = Devise.mappings[:user]
      @user_attributes = FactoryGirl.attributes_for :user
      p @user_attributes
      post :create, { user: @user_attributes }
	    expect(response).to have_http_status(200)
    end

end
