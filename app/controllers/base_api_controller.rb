class BaseApiController < ActionController::Base
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for Admin
  before_action :load_user

  respond_to :json

  def load_user
    @current_api_user = Admin.find_by(email: admin_email, authentication_token: api_token.to_s)
  end

  def api_token
    request.headers["X-Admin-Token"] || params[:admin_token]
  end

  def admin_email
    request.headers["X-Admin-Email"] || params[:admin_email]
  end
end
