require 'rails_helper'
require 'devise'
RSpec.describe Api::V1::SessionsController, :type => :controller do

	    it "should be json" do
	      @request.env["devise.mapping"] = Devise.mappings[:user]
	      p "hello world"
	      p warden
	      # user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret')
	      post :create, "user" => {"email" =>"user@example.com", "password" => "123123"}
	   #    p @request.params
	   #    # , :user => {:email =>"user@example.com", :password => "123123", :password_confirmation =>"123123"}
		  expect(response).to have_http_status(200)
	    end

	    it "renders the index template" do
	      
	    end

end
