class EspaciosController < ApplicationController
    def index
        @museo=Museo.find(params[:museo_id])
        @espacios=@museo.espacios
    end
    def new
        @museo=Museo.find(params[:museo_id])
        @espacio=@museo.espacios.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @espacio=@museo.espacios.create(params[:espacio])
        @espacio.save
        redirect_to museo_espacios_path(:museo_id=>@museo,:id=>@espacio)
    end
    def show
        @espacio=Espacio.find(params[:id])
    end
    def edit
         @espacio=Espacio.find(params[:id])
         @museo=@espacio.museo
    end
    def destroy
        @espacio = Espacio.find(params[:id])
        @museo=@espacio.museo
        @espacio.destroy

        respond_to do |format|
            format.html { redirect_to museo_espacios_path(@museo) }
        end
    end
    def update
        @espacio = Espacio.find(params[:id])
        @museo=@espacio.museo

            if @espacio.update_attributes(params[:espacio])
                  redirect_to museo_espacio_path(:museo_id=>@museo,:id=>@espacio), :notice => 'Espacio actualizado'
            end
    end
end
