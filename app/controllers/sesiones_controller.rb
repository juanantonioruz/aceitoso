class SesionesController < ApplicationController

  def new
  
  end
  def create 

   if  params[:nombre]=='aceitoso' && params[:password]=='aceitoso'
       session[:usuario_id]=1
       redirect_to museos_path,:notice=>'Identificado correctamente'
   else 
      redirect_to login_path, :notice =>  'Datos incorrectos'
   end 
  end
  def destroy
    session[:usuario_id] = nil
     redirect_to login_path, :notice => 'Desconectado correctamente' 
  end

end
