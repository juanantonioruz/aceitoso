class GenericaRelacionsController < ApplicationController

   def create
#        if(params[:generica]=="true")
#        @resultados= Relacion.find_by_generica_origen_id_and_generica_fin_id_and_sentido_relacion_id(params[:relacion][:generica_origen_id], params[:relacion][:generica_fin_id],params[:relacion][:sentido_relacion_id])
#        else
#        @resultados= Relacion.find_by_generica_origen_id_and_museo_fin_id_and_sentido_relacion_id(params[:relacion][:generica_origen_id], params[:relacion][:museo_fin_id],params[:relacion][:sentido_relacion_id])
#        end
#        if(!@resultados.nil?)
#        flash[:notice] = "Ya existe esa relacion!"
#        redirect_to generica_path(params[:relacion][:generica_origen_id])     
#        else
        @relacion=Relacion.create(params[:relacion])
        puts "ooooooooooooooooooooooooooooooooo #{@relacion}"
        @relacion.save
        redirect_to generica_path(@relacion.origen.heir)     
#        end
    end
    
       def destroy
          @relacion=Relacion.find(params[:id])
          @relacion.destroy
          redirect_to generica_path(@relacion.origen.heir)     
       end

end
