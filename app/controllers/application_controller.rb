class ApplicationController < ActionController::Base
  layout 'admin'
  protect_from_forgery

  #before_filter :basic_authenticate 


  private
  def basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username=="aceitoso" && password=="aceitoso"
    end
  end
end
