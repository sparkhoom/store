require 'rails_helper'
require 'devise'
RSpec.describe Api::V1::SessionsController, :type => :controller do

		before(:all) do
		end
	    it "should be json" do
	      user = create(:user)
		  @request.env["devise.mapping"] = Devise.mappings[:user]
	      # user = User.new(:name => 'testuser', :email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret')
	      post :create, user: {email: user.email, password: user.password}
		  expect(response).to have_http_status(200)
	    end

	    it "renders the index template" do
	      
	    end

end
