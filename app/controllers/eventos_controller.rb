class EventosController < ApplicationController
    def index
        @museo=Museo.find(params[:museo_id])
        @eventos=@museo.eventos
    end
    def new
        @museo=Museo.find(params[:museo_id])
        @evento=@museo.eventos.new
    end
    def create
        @museo=Museo.find(params[:museo_id])
        @evento=@museo.eventos.create(params[:evento])
        @evento.save
        redirect_to museo_evento_path(:museo_id=>@museo,:id=>@evento)
    end
    def show
        @evento=Evento.find(params[:id])
    end
    def edit
         @evento=Evento.find(params[:id])
         @museo=@evento.museo
    end
    def destroy
        @evento = Evento.find(params[:id])
        @museo=@evento.museo
        @evento.destroy

        respond_to do |format|
            format.html { redirect_to museo_eventos_path(@museo) }
        end
    end
    def update
        @evento = Evento.find(params[:id])
        @museo=@evento.museo

            if @evento.update_attributes(params[:evento])
                  redirect_to museo_evento_path(:museo_id=>@museo,:id=>@evento), :notice => 'Evento historico actualizada'
            end
    end
end
