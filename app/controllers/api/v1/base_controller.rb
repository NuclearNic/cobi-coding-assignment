class Api::V1::BaseController < ActionController::Base
  respond_to :json
  # after_filter :allow_cross_domain_access
  # protect_from_forgery with: :null_session

  protected

  def allow_cross_domain_access
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Max-Age'] = '1728000'
  end

end
