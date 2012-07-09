class ApplicationController < ActionController::Base
  layout 'admin'
  protect_from_forgery

  #before_filter :basic_authenticate 
  helper_method :logado,:pide_login
  
  private
  def basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username=="aceitoso" && password=="aceitoso"
    end
  end

  ######################Autenticacion en sesiones_controller ## la clave y usuario alli tb
  def pide_login
     if !logado
        redirect_to login_path,:notice=>'Se requiere usuario y clave'
	   end
 end
  
 
 def logado
    if session[:usuario_id]!=nil
       return true;
    else
       return false;
    end  
 end
 
 



end
