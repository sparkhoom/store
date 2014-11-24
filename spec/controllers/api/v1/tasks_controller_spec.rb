require 'rails_helper'
require 'devise'
RSpec.describe Api::V1::TasksController, :type => :controller do
	before(:each) do
    user = create(:user)
    request.headers['X-User-Email'] = user.email
    request.headers['X-User-Token'] = user.authentication_token
	end
  
  it "unauthorized, need to sign in to get the tasks" do
    get :index
    expect(response).to have_http_status(200)
  end

end
