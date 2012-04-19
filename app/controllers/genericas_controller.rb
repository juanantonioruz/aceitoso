class GenericasController < ApplicationController

    def index
        @genericas=Generica.all
    end

    def new
        @generica=Generica.new
    end
    def create
        @generica=Generica.create(params[:generica])
        @generica.save
        redirect_to @generica
    end
    def show
        @generica=Generica.find(params[:id])
    end
    def edit
        @generica=Generica.find(params[:id])
    end
    def relacion
        @generica=Generica.find(params[:id])
    end

    def update
        @generica = Generica.find(params[:id])

        respond_to do |format|
            if @generica.update_attributes(params[:generica])
                format.html { redirect_to @generica, :notice => 'Informacion actualizada' }
            else
                format.html { render :action => "edit"}
            end
        end
    end
    def destroy
    @generica = Generica.find(params[:id])
    @generica.destroy

    respond_to do |format|
      format.html { redirect_to genericas_url }
    end
  end
end
