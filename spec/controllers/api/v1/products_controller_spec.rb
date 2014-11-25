require 'rails_helper'

RSpec.describe Api::V1::ProductsController, :type => :controller do
  render_views
  let(:user) { FactoryGirl.create(:user) }
  let(:json_response) { response.body }
  let(:parsed_response) { JSON.parse(json_response) }

  describe "GET 'index'" do
    before { 10.times {FactoryGirl.create :product}}

    before { get :index, :format => 'json' }

    specify { expect(response).to be_success }

    specify { expect(parsed_response['info']).to eq("ok") }

    specify { expect(parsed_response['data']['products_count']).to eq(10) }

    specify { expect(response).to have_http_status(200) }
    
  end
end
    

