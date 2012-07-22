module AdminHelper
  def logado
    if session[:usuario_id]!=nil
       return true;
    else
       return false;
    end  
 end
end
