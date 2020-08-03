class ApplicationController < ActionController::Base
  include ActionController::RespondWith

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  respond_to :json

  rescue_from ::ActionController::ParameterMissing, with: :bad_request
  rescue_from ::NameError, with: :bad_request

  def not_found
    head :not_found
  end

  def bad_request
    head :bad_request
  end
end
