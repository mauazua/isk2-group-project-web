class Api::UsersController < BaseApiController
  def index
    @users = User.all
    render json: @users
  end
end
