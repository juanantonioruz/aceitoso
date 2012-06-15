class EmailController < ApplicationController
  	
  	def new
  	  @email = Email.new
 	end

  	def create
    	@email = Email.new(params[:email])
      @email.destino='juanantonioruz@gmail.com'
      @email.email='juanantonioruz@gmail.com'
    	if @email.valid?
      		ContactoMailer.contactar(@email).deliver
          @mensaje="buen envio"
      		#redirect_to(@email.url, :notice => t("enviook"))
    	else
          @mensaje="mal envio"
      	#redirect_to(@url,:notice=>t('enviobad'))
      	
    	end
  end
 
 
 
end
