class ResourcesController < ApplicationController
  layout 'application'
   require 'csv'

def genera
  museos=Museo.find(:all)
  CSV.generate({:col_sep => "\t"}) do |csv| 
    csv << %w{point title description icon}
   for museo in museos do 
        ficha=museo.ficha
        if(!ficha.y.nil?)
        csv << "#{ficha.x},#{ficha.y}|#{museo.nombre}|#{ficha.descripcion}".split("|")
        end
    end
  end
  
end

  def textfile
    v="point|title|description|icon".split("|").join("\t")+"\n"
      museos=Museo.find(:all)
   for museo in museos do 
        ficha=museo.ficha

    v+="#{ficha.x},#{ficha.y}|#{museo.nombre}|#{ficha.descripcion}".split("|").join("\t")+"\n"
    end
     render :text => v.html_safe 
  end
  def text_cvs vv
    vv.split().each do |csv|



   if csv =~ /\A".*"\z/m then csv.gsub!(/\A"(.*)"\z/m, '\1') end  # remove double-quotes at string beginning & end


  end

  vv

  end


  def search
        logger.info "search::: > buscando .... "+params[:query].to_s
#    logger.info @resource
   query = params[:query].split.map {|term| "%#{term}%" }
   query=params[:query].sub("Articulo: ", "")
   query=query.sub("Museo: ", "")
   query=query.sub("Ruta: ", "")
   query=query.sub("Hito: ", "")
     @resource_museos=  Museo.where(["nombre LIKE ?", "%"+query+"%"])
     @resource_genericas= Generica.where(["titulo LIKE ?", "%"+query+"%"])
     @resource_piezas= Pieza.where(["nombre LIKE ?", "%"+query+"%"])
     @resource_caminos= Camino.where(["nombre LIKE ?", "%"+query+"%"])
     @resource_hitos= Hito.where(["nombre LIKE ?", "%"+query+"%"])
    
#    logger.info @resource.children
    data=DatosSearch.new
#    data.resultado_html="202"
     data.data_museos=@resource_museos
     data.data_genericas=@resource_genericas
     data.data_piezas=@resource_piezas
     data.data_caminos=@resource_caminos
     data.data_hitos=@resource_hitos
    # @resource.each{|el| logger.info (el.class==Museo)}

      respuesta='/* this is javascript */ '+params[:callback].to_s+'({
      "result":[
      {"mid":"1",
      "name":"Serbia",
      "notable":{"name":"Country"}
      },
      {"mid":"2","name":"Seattle","notable":{"name":"City/Town/Village","id":"/location/citytown"},"lang":"en","score":71.649063},
      {"mid":"3","name":"Sex","notable":{"name":"Route of infection transmission","id":"/medicine/transmission_route"},"lang":"en","score":64.541069},
      {"mid":"4","name":"Seoul","notable":{"name":"City/Town/Village","id":"/location/citytown"},"lang":"en","score":63.484711},
      {"mid":"5","name":"Senegal","notable":{"name":"Country","id":"/location/country"},"lang":"en","score":62.349876}
      ]
      });'
         # logger.info respuesta
            respuesta='/* this is javascript */ '+params[:callback].to_s+'('+data.to_json().to_s+');'
          #logger.info respuesta
            render :text => respuesta
  end
  def busca(id_param)
        resultado=Relacionable.find_by_id(id_param).heir
        
        if [Generica, Pieza, Hito, Camino].include?resultado.class
          html=resultado.descripcion
        elsif resultado.class==Museo
          html=resultado.ficha.descripcion
        end
    return resultado, html
  end

  def fly

        logger.info "consulta suggest por mid > id .... "+params[:id].to_s
      resultado, html=busca(params[:id])      

     #   logger.info museo.ficha.descripcion
      respuesta ='/** this is jsonp **/ '+params[:callback].to_s+'({"id":"'+resultado.id.to_s+'","html":\''+html+'\'});'
                render :text => respuesta
  end
  def show
    @museos=Museo.find(:all)
         respond_to do |format|
 format.html # show.html.erb
end
  end
  def relacionables
         respond_to do |format|
            format.xml {render :xml => Relacionable.find(:all).to_xml(:only => [:id,:heir_type], :include=>{:heir=>{:except=>[:descripcion, :created_at,:updated_at]}})}
end
#@equipos.sort_by( &:id).to_xml(:only => [:id, :nombre,:x,:y])}
  end
  def detalla
      resultado, html=busca(params[:id])      

    @resource=resultado
    data=Datos.new
    data.data=@resource
    data.resultado_html=html
    
     
    # respond_to do |format|
 #format.html # show.html.erb
 #format.json {render :text => '{"data":{"attributes":[{"values":[{"name":"Ferdinand Porsche","id":"/en/ferdinand_porsche"}],"name":"Founders","id":"/organization/organization/founders"},{"values":[],"name":"Headquarters","id":"/organization/organization/headquarters"},{"values":[{"name":"Automobile","id":"/en/automobile"}],"name":"Industry","id":"/business/business_operation/industry"},{"values":[],"name":"Equivalent Instances","id":"/base/ontologies/ontology_instance/equivalent_instances"},{"values":[],"name":"Employees and other personnel","id":"/business/employer/employees"},{"values":[{"name":"Porsche 911","id":"/en/porsche_911"},{"name":"Porsche","id":"/m/0h5wrrb"}],"name":"Make(s)","id":"/automotive/company/make_s"}],"name":"Porsche","id":"/en/porsche"},"details_html":"details"}'}
# format.json {render :json =>data.to_json( ) }
  render :text =>data.to_json( ) 
#end
#end
end

end