class ApplicationController < ActionController::Base
  layout 'admin'
  protect_from_forgery
<<<<<<< HEAD
  before_filter :basic_authenticate ,:except => [:mapa,:index,:show]
=======
  before_filter :basic_authenticate 
>>>>>>> ef67aea6b39e1a1e9adeb41515cb6e30d38230b9

  private
  def basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username=="aceitoso" && password=="aceitoso"
    end
  end
end
