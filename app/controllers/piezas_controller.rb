class PiezasController < ApplicationController
    def index
        @museo=Museo.find(params[:museo_id])
        @piezas=@museo.piezas
    end
    def new
        @museo=Museo.find(params[:museo_id])
        @pieza=@museo.piezas.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @pieza=@museo.piezas.create(params[:pieza])
        @pieza.save
        redirect_to museo_pieza_path(:museo_id=>@museo,:id=>@pieza)
    end
    def show
        @pieza=Pieza.find(params[:id])
    end
    def edit
         @pieza=Pieza.find(params[:id])
         @museo=@pieza.museo
    end
    def relacion
         @pieza=Pieza.find(params[:id])
         @museo=@pieza.museo
    end
    def destroy
        @pieza = Pieza.find(params[:id])
        @museo=@pieza.museo
        @pieza.destroy

        respond_to do |format|
            format.html { redirect_to museo_piezas_path(@museo) }
        end
    end
    def update
        @pieza = Pieza.find(params[:id])
        @museo=@pieza.museo

            if @pieza.update_attributes(params[:pieza])
                  redirect_to museo_pieza_path(:museo_id=>@museo,:id=>@pieza), :notice => 'Pieza actualizada'
            end
    end
end
