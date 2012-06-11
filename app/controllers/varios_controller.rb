class VariosController < ApplicationController
  # GET /varios
  # GET /varios.json
  def index
      @museo=Museo.find(params[:museo_id])
        @varios=@museo.varios
  end

  def show
    @vario = Vario.find(params[:id])

  
  end

  def new
        @museo=Museo.find(params[:museo_id])
        @vario=@museo.varios.new
  end

  # GET /varios/1/edit
  def edit
    @vario = Vario.find(params[:id])
             @museo=@vario.museo

  end

  def create
        @museo=Museo.find(params[:museo_id])
        @vario=@museo.varios.create(params[:vario])
        @vario.save
        redirect_to museo_vario_path(:museo_id=>@museo,:id=>@vario)
  end

  def update
     @vario = Vario.find(params[:id])
        @museo=@vario.museo

            if @vario.update_attributes(params[:vario])
                  redirect_to museo_vario_path(:museo_id=>@museo,:id=>@vario), :notice => 'Informacion actualizada'
            end
  end

  def destroy
     @vario = Vario.find(params[:id])
        @museo=@vario.museo
        @vario.destroy

        respond_to do |format|
            format.html { redirect_to museo_varios_path(@museo) }
        end
  end
end
