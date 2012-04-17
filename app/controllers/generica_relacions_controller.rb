class GenericaRelacionsController < ApplicationController

   def create
        @resultados= Relacion.find_by_origen_id_and_fin_id_and_sentido_relacion_id(params[:relacion][:origen_id], params[:relacion][:fin_id],params[:relacion][:sentido_relacion_id])
#        else
#        @resultados= Relacion.find_by_generica_origen_id_and_museo_fin_id_and_sentido_relacion_id(params[:relacion][:generica_origen_id], params[:relacion][:museo_fin_id],params[:relacion][:sentido_relacion_id])
#        end
        @sentido=SentidoRelacion.find_by_id(params[:relacion][:sentido_relacion_id])
        
        @sentido.nombre_relacion.sentidos.each{|s| @otro_sentido=s unless s==@sentido}
        @resultados_inversos= Relacion.find_by_origen_id_and_fin_id_and_sentido_relacion_id(params[:relacion][:fin_id], params[:relacion][:origen_id],@otro_sentido.id)
        if(!@resultados.nil?)
        flash[:notice] = "Ya existe esa relacion!"
        redirect_to generica_path(params[:generica_id])
        elsif(!@resultados_inversos.nil?)
        puts "inversos------------------- #{@resultados_inversos}"
            flash[:notice] = "Ya existe esa relacion pero a la inversa!"
          redirect_to generica_path(params[:generica_id])

        else
        @relacion=Relacion.create(params[:relacion])
        puts "ooooooooooooooooooooooooooooooooo #{@relacion}"
        @relacion.save
        redirect_to generica_path(@relacion.origen.heir)     
        end
    end
    
       def destroy
          @relacion=Relacion.find(params[:id])
          @relacion.destroy
          redirect_to generica_path(@relacion.origen.heir)     
       end

end
