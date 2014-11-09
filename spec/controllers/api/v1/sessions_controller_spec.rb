require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do

	    it "should be json" do
	      @request.env["devise.mapping"] = Devise.mappings[:user]
	      p "hello world"
	      # post :create, "session"=>{"user"=>{"email"=>"user@example.com", "password"=>"11111111"}}
	   #    p @request.params
	   #    # , :user => {:email =>"user@example.com", :password => "123123", :password_confirmation =>"123123"}
		  # expect(page).to have_http_status(200)
	    end

	    it "renders the index template" do
	      
	    end

end
