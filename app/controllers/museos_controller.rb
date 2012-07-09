class MuseosController < ApplicationController
 
    before_filter :pide_login
    

    def index
        @museos=Museo.all(:order=>:nombre)
    end
    def new
        @museo=Museo.new
    end
    def create
        @museo=Museo.create(params[:museo])
        expire_page :action => :index
        @museo.ficha=Ficha.create  ####Ojo al 1-1 asi es muy limpio
        @museo.save
        
        redirect_to @museo
    end
    def show
        @museo=Museo.find(params[:id])
    end
    def edit
        @museo=Museo.find(params[:id])
    end
    def relacion
        @museo=Museo.find(params[:id])
    end

    def update
        expire_page :action => :index
        @museo = Museo.find(params[:id])

        respond_to do |format|
            if @museo.update_attributes(params[:museo])
                
                format.html { redirect_to @museo, :notice => 'Informacion actualizada' }
            else
                format.html { render :action => "edit"}
            end
        end
    end
    def destroy
    expire_page :action => :index
    @museo = Museo.find(params[:id])
    @museo.destroy

    respond_to do |format|
      format.html { redirect_to museos_url }
    end
    end

end
