class CoordenadasController < ActionController::Base
    def create
        @coordenada=Coordenada.create(params[:coordenada])
        @coordenada.save
        @camino=@coordenada.camino
        @museo=@camino.entorno.museo
        
       redirect_to museo_entorno_camino_path(:museo_id=>@museo,:id=>@camino)
    end


    
    def destroy
        
       @coordenada=Coordenada.find(params[:id])
       @camino=@coordenada.camino
       @museo=@camino.entorno.museo
       @coordenada.destroy
        
       redirect_to museo_entorno_camino_path(:museo_id=>@museo,:id=>@camino)
       
    end
   


end
