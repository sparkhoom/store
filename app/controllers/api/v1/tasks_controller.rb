# file: app/controllers/api/v1/tasks_controller.rb
class Api::V1::TasksController < ApplicationController
  # skip_before_filter :verify_authenticity_token,
  #                    :if => Proc.new { |c| c.request.format == 'application/json' }
  # Just skip the authentication for now
  acts_as_token_authentication_handler_for User
  

  respond_to :json

  def index
    render :text => '{
  "success":true,
  "info":"ok",
  "data":{
          "tasks":[
                    {"title":"Complete the app"},
                    {"title":"Complete the tutorial"}
                  ]
         }
  }',
  :status => 200
  end

end