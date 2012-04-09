 class FichasController < ApplicationController
    def show
        @museo=Museo.find(params[:museo_id])
        if @museo.ficha.nil?
             @museo.ficha=Ficha.create  ####Ojo al 1-1 asi es muy limpio
             @museo.save
        end
        @ficha=@museo.ficha
            
    end 
    def edit
        @museo=Museo.find(params[:museo_id])
        @ficha=@museo.ficha
    end
    
    def update
        @museo = Museo.find(params[:museo_id])
        @ficha=@museo.ficha

            if @ficha.update_attributes(params[:ficha])
                  redirect_to museo_ficha_path(@museo), :notice => 'Informacion actualizada'
            end
    end

end
