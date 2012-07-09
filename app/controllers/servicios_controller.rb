class ServiciosController < ApplicationController
   
   before_filter :pide_login

 def index
        @museo=Museo.find(params[:museo_id])
        @servicios=@museo.servicios
    end

    def new
        @museo=Museo.find(params[:museo_id])
        @servicio=@museo.servicios.new
    end

     def create
        @museo=Museo.find(params[:museo_id])
        @servicio=@museo.servicios.create(params[:servicio])
        @servicio.save
        redirect_to museo_servicio_path(:museo_id=>@museo,:id=>@servicio)
    end
    def show
        @servicio=Servicio.find(params[:id])
        @museo=@servicio.museo
    end
    def edit
            @servicio=Servicio.find(params[:id])
            @museo=@servicio.museo
    end

    def update 
        @servicio=Servicio.find(params[:id])
        @servicio.update_attributes(params[:servicio])
        redirect_to museo_servicio_path(@servicio)
    end 
    def destroy
        @servicio=Servicio.find(params[:id])
        @museo=@servicio.museo
        @servicio.destroy
        redirect_to museo_servicios_path(@museo)
    end
end
