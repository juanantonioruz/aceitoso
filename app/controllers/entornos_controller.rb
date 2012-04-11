class EntornosController < ActionController::Base
    layout 'admin'
    def show
        @museo=Museo.find(params[:museo_id])
        if @museo.entorno.nil?
             @museo.entorno=Entorno.create  ####Ojo al 1-1 asi es muy limpio
             @museo.save
        end
        @entorno=@museo.entorno
            
    end 
    def edit
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
    end
    
    def update
        @museo = Museo.find(params[:museo_id])
        @entorno=@museo.entorno
            if @entorno.update_attributes(params[:entorno])
                  redirect_to museo_entorno_path(@museo), :notice => 'Informacion actualizada'
            end
    end

end

