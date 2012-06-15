class EmailController < ApplicationController
  	
  	def new
  	  @email = Email.new
 	end

  	def create
    	@email = Email.new(params[:email])
        @url=params[:email][:url]
    	if @email.valid?
      		ContactoMailer.contactar(@email).deliver
      		redirect_to(@email.url, :notice => t("enviook"))
    	else
      	redirect_to(@url,:notice=>t('enviobad'))
      	
    	end
  	end
end
