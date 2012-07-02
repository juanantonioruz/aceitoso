class EmailController < ApplicationController
  layout 'resumen'
  	def new
  	  @email = Email.new
 	end

  	def create
    	@email = Email.new(params[:email])
    	if @email.valid?
      		ContactoMailer.contactar(@email, "juanantonioruz@gmail.com, arquibernardo@gmail.com, marionn.pa@gmail.com").deliver
          @mensaje="el formulario de contacto se ha enviado correctamente"
      		#redirect_to(@email.url, :notice => t("enviook"))
    	else
          @mensaje="no se ha podido enviar el formulario, pruebe otra vez rellenando todos los campos del formulario"
      	#redirect_to(@url,:notice=>t('enviobad'))
      	
    	end
  end
 
 
 
end
