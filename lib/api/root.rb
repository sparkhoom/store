# lib/api/root.rb
module API
  class Root < Grape::API
    prefix    'api'
    format    :json

    rescue_from :all, :backtrace => true
    error_formatter :json, API::ErrorFormatter

    before do
      error!("401 Unauthorized", 401) unless authenticated
    end

    http_basic do |email, password|
      user = User.find_by_email(email)
      user && user.valid_password?(password)
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    mount API::V1::Root
  end
end