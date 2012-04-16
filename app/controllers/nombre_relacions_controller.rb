class NombreRelacionsController < ApplicationController
    
    def index
        @relaciones=NombreRelacion.all
    end
    def new
        @nombre_relacion=NombreRelacion.new
    end

    def create 
        @nombre_relacion=NombreRelacion.create(params[:nombre_relacion])
        @nombre_relacion.sentidos<<SentidoRelacionCreciente.new
        @nombre_relacion.sentidos<<SentidoRelacionDecreciente.new
        @nombre_relacion.save
        redirect_to @nombre_relacion
    end 
    def update 
        @nombre_relacion=NombreRelacion.find(params[:id])
        @nombre_relacion.update_attributes(params[:nombre_relacion])
        redirect_to @nombre_relacion
    end 
    def show
        @nombre_relacion=NombreRelacion.find(params[:id])
    end
    def edit
        @nombre_relacion=NombreRelacion.find(params[:id])
    end
   def destroy
        @nombre_relacion=NombreRelacion.find(params[:id])
        @nombre_relacion.destroy
        redirect_to nombre_relacions_path
    end
end
