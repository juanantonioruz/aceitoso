class InfosController < ApplicationController
    def index
        @museo=Museo.find(params[:museo_id])
        @infos=@museo.infos
    end
    def new
        @museo=Museo.find(params[:museo_id])
        @info=@museo.infos.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @info=@museo.infos.create(params[:info])
        @info.save
        redirect_to museo_info_path(:museo_id=>@museo,:id=>@info)
    end
    def show
        @info=Info.find(params[:id])
    end
    def edit
         @info=Info.find(params[:id])
         @museo=@info.museo
    end
    def relacion
         @info=Info.find(params[:id])
         @museo=@info.museo
    end
    def destroy
        @info = Info.find(params[:id])
        @museo=@info.museo
        @info.destroy

        respond_to do |format|
            format.html { redirect_to museo_infos_path(@museo) }
        end
    end
    def update
        @info = Info.find(params[:id])
        @museo=@info.museo

            if @info.update_attributes(params[:info])
                  redirect_to museo_info_path(:museo_id=>@museo,:id=>@info), :notice => 'Informacion actualizada'
            end
    end
end
