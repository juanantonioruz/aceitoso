class MediosController < ApplicationController
  # GET /medios
  # GET /medios.json
  def index
          @museo=Museo.find(params[:museo_id])

    @medios = @museo.medios

  end

  # GET /medios/1
  # GET /medios/1.json
  def show
    @medio = Medio.find(params[:id])

  
  end

  # GET /medios/new
  # GET /medios/new.json
  def new
     @museo=Museo.find(params[:museo_id])
    @medio = @museo.medios.new

   
  end

  # GET /medios/1/edit
  def edit
    @medio = Medio.find(params[:id])
     @museo=@medio.museo
  end

  # POST /medios
  # POST /medios.json
  def create
       @museo=Museo.find(params[:museo_id])
    @medio = @museo.medios.create(params[:medio])
        @medio.save
        redirect_to museo_medio_path(:museo_id=>@museo,:id=>@medio)

  
  end

  # PUT /medios/1
  # PUT /medios/1.json
  def update
    @medio = Medio.find(params[:id])
     @museo=@medio.museo

               if @medio.update_attributes(params[:medio])
                  redirect_to museo_medio_path(:museo_id=>@museo,:id=>@medio), :notice => 'Informacion actualizada'
            end

  end

  def destroy
    @medio = Medio.find(params[:id])
            @museo=@medio.museo

    @medio.destroy

    respond_to do |format|
            format.html { redirect_to museo_medios_path(@museo) }
    end
  end
end
