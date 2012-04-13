class ResourcesController < ApplicationController
  layout 'application'

  def search
        logger.info "search::: > buscando .... "+params[:query].to_s
#    logger.info @resource
   query = params[:query].split.map {|term| "%#{term}%" }
   sql = "nombre LIKE ?" 

     @resource=Museo.where([sql, "%"+params[:query]+"%"])

#    logger.info @resource.children
    data=DatosSearch.new
#    data.resultado_html="202"
     data.data=@resource

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
  
  def fly

        logger.info "consulta suggest por mid > id .... "+params[:id].to_s
        museo=Museo.find_by_id(params[:id])
        logger.info museo.ficha.descripcion
      respuesta ='/** this is jsonp **/ '+params[:callback].to_s+'({"id":"'+params[:id].to_s+'","html":\''+museo.ficha.descripcion+'\'});'
                render :text => respuesta
  end

  def show
    logger.info "es menor que 500 .... "+params[:id].to_s
    if(!params[:id].nil? ) then  
    @resource=Museo.find_by_id(params[:id])
    logger.info @resource
#    logger.info @resource.children
    data=Datos.new
    data.data=@resource
    
    data.resultado_html=@resource.ficha.descripcion
     respond_to do |format|
 format.html # show.html.erb
 #format.json {render :text => '{"data":{"attributes":[{"values":[{"name":"Ferdinand Porsche","id":"/en/ferdinand_porsche"}],"name":"Founders","id":"/organization/organization/founders"},{"values":[],"name":"Headquarters","id":"/organization/organization/headquarters"},{"values":[{"name":"Automobile","id":"/en/automobile"}],"name":"Industry","id":"/business/business_operation/industry"},{"values":[],"name":"Equivalent Instances","id":"/base/ontologies/ontology_instance/equivalent_instances"},{"values":[],"name":"Employees and other personnel","id":"/business/employer/employees"},{"values":[{"name":"Porsche 911","id":"/en/porsche_911"},{"name":"Porsche","id":"/m/0h5wrrb"}],"name":"Make(s)","id":"/automotive/company/make_s"}],"name":"Porsche","id":"/en/porsche"},"details_html":"details"}'}
 format.json {render :json =>data.to_json( ) }
#end
end
end
end
class DatosSearch
  attr_accessor  :data, :resultado_html
    def as_json(options = {})
    {
    :result=>self.data.map {|mar| {"mid" => mar.id.to_s, "name" => mar.nombre, "notable"=>'aa'} }
    

    }
  end

end
class Datos
  attr_accessor   :data, :resultado_html
    def as_json(options = {})
    {
    :data=>{
    :attributes=>  self.data.ficha.labels.map { |mar| {:id => mar.id.to_s, :name => mar.nombre, :values=>mar.fichas.map { |child| {:name=>child.museo.nombre,:id=>child.museo.id.to_s}}} },
    :name=>self.data.nombre,
    :id=>self.data.id.to_s
    },
    :details_html=>self.data.ficha.descripcion


    }
  end

end
end