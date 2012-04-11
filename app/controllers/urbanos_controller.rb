class UrbanosController < ApplicationController

    def index
       @museo=Museo.find(params[:museo_id])
       @urbanos=@museo.urbanos
    end
    
    def new
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
        @urbano=@entorno.urbanos.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
        @urbano=@entorno.urbanos.create(params[:urbano])
        @urbano.save
        redirect_to museo_entorno_urbano_path(:museo_id=>@museo,:id=>@urbano)
    end
    def show
        @urbano=Urbano.find(params[:id])
        @entorno=@urbano.entorno
        @museo=@entorno.museo
    end
    def edit
        @urbano=Urbano.find(params[:id])
        @entorno=@urbano.entorno
        @museo=@entorno.museo
    end
    def destroy
        @urbano = Urbano.find(params[:id])
        @museo=@urbano.museo
        @urbano.destroy

        respond_to do |format|
            format.html { redirect_to museo_entorno_urbanos_path(@museo) }
        end
    end
    def update
        @urbano = Urbano.find(params[:id])
        @entorno=@urbano.entorno
        @museo=@entorno.museo

            if @urbano.update_attributes(params[:urbano])
                  redirect_to museo_entorno_urbano_path(:museo_id=>@museo,:id=>@urbano), :notice => 'Informacion actualizada'
            end
    end
end
