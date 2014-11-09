require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do

	before(:all) do
	end

    it "login in successully" do
      user = build(:user)
	  @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, user: { email: user.email, password: user.password, password_confirmation: user.password_confirmation}
	  expect(response).to have_http_status(200)
    end

end
