class ApplicationController < ActionController::Base
  layout 'admin'
  protect_from_forgery
 # before_filter :basic_authenticate ,:except => [:mapa]

  private
  def basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username=="1234" && password=="1234"
    end
  end
end
