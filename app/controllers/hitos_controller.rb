class HitosController < ApplicationController

    def index
       @museo=Museo.find(params[:museo_id])
       @hitos=@museo.hitos
    end
    
    def new
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
        @hito=@entorno.hitos.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @entorno=@museo.entorno
            if params[:hito][:service_id].nil?
                    flash[:notice] = "tienes que seleccionar una imagen para este hito!" 
                    redirect_to request.referer
                    elsif
        @hito=@entorno.hitos.create(params[:hito])
       
        @hito.save
        redirect_to museo_entorno_hito_path(:museo_id=>@museo,:id=>@hito)
        end
        
    end
    def show
        @hito=Hito.find(params[:id])
    end
    def edit
        @hito=Hito.find(params[:id])
        @entorno=@hito.entorno
        @museo=@entorno.museo
    end
    def relacion
        @hito=Hito.find(params[:id])
        @entorno=@hito.entorno
        @museo=@entorno.museo
    end
    def destroy
        @hito = Hito.find(params[:id])
        @museo=@hito.museo
        @hito.destroy

        respond_to do |format|
            format.html { redirect_to museo_entorno_hitos_path(@museo) }
        end
    end
    def update
        @hito = Hito.find(params[:hito][:id])
        @entorno=@hito.entorno
        @museo=@entorno.museo
            if params[:hito][:service_id].nil?
                    flash[:notice] = "tienes que seleccionar una imagen para este hito!" 
                    redirect_to request.referer
              elsif @hito.update_attributes(params[:hito])
                  redirect_to museo_entorno_hito_path(:museo_id=>@museo,:id=>@hito), :notice => 'Informacion actualizada'
            end
    end
end
