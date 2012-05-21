module ModuloRelaciones
  
  
  def destruye pathito
            @relacion=Relacion.find(params[:id])
        @relacion.destroy
            lista=Hash[:id=>@relacion.origen.heir]
          if defined? params[:museo_id] then lista[:museo_id]=params[:museo_id] end 
          redirect_to send("#{pathito}_path", lista)


  end
  def crea pathito, parametro
        @resultados= Relacion.find_by_origen_id_and_fin_id_and_sentido_relacion_id(params[:relacion][:origen_id], params[:relacion][:fin_id],params[:relacion][:sentido_relacion_id])
        @sentido=SentidoRelacion.find_by_id(params[:relacion][:sentido_relacion_id])
        
        @sentido.nombre_relacion.sentidos.each{|s| @otro_sentido=s unless s==@sentido}
        @resultados_inversos= Relacion.find_by_origen_id_and_fin_id_and_sentido_relacion_id(params[:relacion][:fin_id], params[:relacion][:origen_id],@otro_sentido.id)
          if(!@resultados.nil?)
          flash[:notice] = "Ya existe esa relacion!"
            lista=Hash[:id=>params["#{parametro}_id"]]

          if defined? params[:museo_id] then lista[:museo_id]=params[:museo_id] end 

          redirect_to send(pathito+"_path",lista)
        elsif(!@resultados_inversos.nil?)
          flash[:notice] = "Ya existe esa relacion pero a la inversa!"
                      lista=Hash[:id=>params["#{parametro}_id"]]

          if defined? params[:museo_id] then lista[:museo_id]=params[:museo_id] end 

          redirect_to send(pathito+"_path",lista)
        else
          @relacion=Relacion.create(params[:relacion])
          @relacion.save
          lista=Hash[:id=>@relacion.origen.heir]
          if defined? params[:museo_id] then lista[:museo_id]=params[:museo_id] end 
          redirect_to send("#{pathito}_path", lista)
        end
  end
end