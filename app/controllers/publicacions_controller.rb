class PublicacionsController < ApplicationController
    def index
        @museo=Museo.find(params[:museo_id])
        @publicacions=@museo.publicacions
    end
    def new
        @museo=Museo.find(params[:museo_id])
        @publicacion=@museo.publicacions.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @publicacion=@museo.publicacions.create(params[:publicacion])
        @publicacion.save
        redirect_to museo_publicacion_path(:museo_id=>@museo,:id=>@publicacion)
    end
    def show
        @publicacion=Publicacion.find(params[:id])
    end
    def edit
         @publicacion=Publicacion.find(params[:id])
         @museo=@publicacion.museo
    end
    def destroya
        @publicacion = Publicacion.find(params[:id])
        @museo=@publicacion.museo
        @publicacion.destroy

        respond_to do |format|
            format.html { redirect_to museo_publicacions_path(@museo) }
        end
    end
    def update
        @publicacion = Publicacion.find(params[:id])
        @museo=@publicacion.museo

            if @publicacion.update_attributes(params[:publicacion])
                  redirect_to museo_publicacion_path(:museo_id=>@museo,:id=>@publicacion), :notice => 'Publicacion actualizada'
            end
    end
end
