class PremiosController < ApplicationController
    def index
        @museo=Museo.find(params[:museo_id])
        @premios=@museo.premios
    end
    def new
        @museo=Museo.find(params[:museo_id])
        @premio=@museo.premios.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @premio=@museo.premios.create(params[:premio])
        @premio.save
        redirect_to museo_premio_path(:museo_id=>@museo,:id=>@premio)
    end
    def show
        @premio=Premio.find(params[:id])
    end
    def edit
         @premio=Premio.find(params[:id])
         @museo=@premio.museo
    end
    def destroy
        @premio = Premio.find(params[:id])
        @museo=@premio.museo
        @premio.destroy

        respond_to do |format|
            format.html { redirect_to museo_premios_path(@museo) }
        end
    end
    def update
        @premio = Premio.find(params[:id])
        @museo=@premio.museo

            if @premio.update_attributes(params[:premio])
                  redirect_to museo_premio_path(:museo_id=>@museo,:id=>@premio), :notice => 'Informacion actualizada'
            end
    end
end
