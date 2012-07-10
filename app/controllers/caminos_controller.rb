class CaminosController < ApplicationController
    before_filter :pide_login

    def index
       @museo=Museo.find(params[:museo_id])
       @caminos=@museo.caminos
    end
    
    def new
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
        @camino=@entorno.caminos.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
        @camino=@entorno.caminos.create(params[:camino])
        @camino.save
        redirect_to museo_entorno_camino_path(:museo_id=>@museo,:id=>@camino)
    end
    def show
        @camino=Camino.find(params[:id])
        @entorno=@camino.entorno
        @museo=@entorno.museo
    end
    def edit
        @camino=Camino.find(params[:id])
        @entorno=@camino.entorno
        @museo=@entorno.museo
    end
    def relacion
        @camino=Camino.find(params[:id])
        @entorno=@camino.entorno
        @museo=@entorno.museo
    end
    def destroy
        @camino = Camino.find(params[:id])
        @museo=@camino.museo
        @camino.destroy

        respond_to do |format|
            format.html { redirect_to museo_entorno_caminos_path(@museo) }
        end
    end
    def update
        @camino = Camino.find(params[:camino][:id])
        @entorno=@camino.entorno
        @museo=@entorno.museo

            if @camino.update_attributes(params[:camino])
                  redirect_to museo_entorno_camino_path(:museo_id=>@museo,:id=>@camino), :notice => 'Informacion actualizada'
            end
    end
end
