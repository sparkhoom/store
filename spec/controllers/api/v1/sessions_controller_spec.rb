require 'rails_helper'
require 'devise'
RSpec.describe Api::V1::SessionsController, :type => :controller do

		before(:all) do
		end
	    it "login in successully" do
	      user = create(:user)
		  @request.env["devise.mapping"] = Devise.mappings[:user]
	      # user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret')
	      post :create, user: {email: user.email, password: user.password}
	      body = JSON.parse(response.body)

	      expect(body["success"]).to eq true
		  expect(response).to have_http_status(200)
	    end

	    it "login in unsucessfully" do
	      user = create(:user)
		  @request.env["devise.mapping"] = Devise.mappings[:user]
		  post :create, user: {email: user.email, password: "invaid password"}
		  expect(response).to have_http_status(401)
	    end

	    it "log out sucessfuly" do
	      user = create(:user)
		  @request.env["devise.mapping"] = Devise.mappings[:user]
		  post :create, user: {email: user.email, password: user.password}
		  auth_params = {
		        "auth_token" => user.authentication_token
		   }
		  request_headers = {
	        "Accept" => "application/json",
	        "Content-Type" => "application/json"
	      }
		  delete :destroy, auth_params,request_headers
      	  expect(response.status).to eq 200
	    end

	    it "log out notsucessfuly" do
	      user = create(:user)
		  request.env["devise.mapping"] = Devise.mappings[:user]
		  post :create, user: {email: user.email, password: user.password}
		  delete :destroy
		  expect(response.status).to eq 404
	    end

	    def response_body
    		JSON.parse(response.body)
  		end

end
