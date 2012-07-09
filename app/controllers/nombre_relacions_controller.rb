class NombreRelacionsController < ApplicationController
    
    before_filter :pide_login

    def index
        @relaciones=NombreRelacion.all(:order=>:nombre1)
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
    def relaciones
        @relaciones_crecientes=[]
        @relaciones_decrecientes=[]
        @nombre_relacion=NombreRelacion.find(params[:id])
        sentidos=@nombre_relacion.sentidos # .sort{|a,b| b.creciente <=> a.creciente}
        sentidos.map do |s| 
          s.relaciones.map do |rel|
            if s.creciente=="1" then
            @relaciones_crecientes << rel
          else
            @relaciones_decrecientes << rel
          end
          end
        end

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
