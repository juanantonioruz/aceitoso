class EmailController < ApplicationController
  layout 'resumen'
  	def new
  	  @email = Email.new
 	end

  	def create
    	@email = Email.new(params[:email])
    	if @email.valid?
      		ContactoMailer.contactar(@email, "juanantonioruz@gmail.com, arquibernardo@gmail.com, marionn.pa@gmail.com").deliver
          @mensaje="buen envio"
      		#redirect_to(@email.url, :notice => t("enviook"))
    	else
          @mensaje="mal envio"
      	#redirect_to(@url,:notice=>t('enviobad'))
      	
    	end
  end
 
 
 
end
