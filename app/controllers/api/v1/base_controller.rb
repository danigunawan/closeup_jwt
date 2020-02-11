class Api::V1::BaseController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: {success: false, errors: 'Not Authorized', message: 'Not Authorized'}, status: 401 unless @current_user
  end

end