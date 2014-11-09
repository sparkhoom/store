class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'}
  respond_to :json
  def create
    p warden.params
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :data => { :auth_token => current_user.authentication_token } }
  end

  def destroy
    user = User.find_by_authentication_token(params[:auth_token])
    if user
      user.reset_authentication_token!
      render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
    else
      render :json => { :message => 'Invalid token.' }, :status => 404
    end
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end

end