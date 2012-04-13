class ResourcesController < ApplicationController
  layout 'application'

  def search
        logger.info "search::: > buscando .... "+params[:query].to_s
#    logger.info @resource
   query = params[:query].split.map {|term| "%#{term}%" }
     @resource_museos=  Museo.where(["nombre LIKE ?", "%"+params[:query]+"%"])
     @resource_genericas= Generica.where(["titulo LIKE ?", "%"+params[:query]+"%"])
    
#    logger.info @resource.children
    data=DatosSearch.new
#    data.resultado_html="202"
     data.data_museos=@resource_museos
     data.data_genericas=@resource_genericas
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
            parametros=id_param.split('-')
        if parametros[1]=='I' then
        resultado=Generica.find_by_id(parametros[0])
          html=resultado.descripcion
          else
        resultado=Museo.find_by_id(parametros[0])
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
         respond_to do |format|
 format.html # show.html.erb
end
  end
  def detalla
    logger.info "es menor que 500 .... "+params[:id].to_s
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
class DatosSearch
  attr_accessor  :data_museos,:data_genericas, :resultado_html
    def as_json(options = {})
    {
    :result=>dameMuseos+dameGenericas
    

    }
  end
  def dameMuseos
    resp=self.data_museos.map {|mar| {"mid" => mar.id.to_s+"-"+(mar.class==Museo ? "M" :"I"), "name" => mar.nombre, "notable"=>'aa'} }
    print resp.class
    resp
  end
  def dameGenericas
    resp=self.data_genericas.map {|mar| {"mid" => mar.id.to_s+"-"+(mar.class==Museo ? "M" :"I"), "name" => mar.titulo, "notable"=>'aa'} }
    print resp.class
    resp
  end

end
class Datos
  attr_accessor   :data, :resultado_html, :coordenadas
    def as_json(options = {})
    {
    :data=>{
    :attributes=>  dameAtributos,
    :name=>(self.data.class==Museo)? self.data.nombre : self.data.titulo ,
    :id=>self.data.id.to_s
    },
    :details_html=>(self.data.class==Museo)? self.data.ficha.descripcion : self.data.descripcion, 
    :coords=>(self.data.class==Museo)? self.data.ficha.x+"x"+self.data.ficha.y : ""


    }
  end
  def dameAtributos
    if self.data.class==Museo
      value=self.data.ficha
    else
      value=self.data
    end
    value.labels.map { |mar| {:id => mar.id.to_s+"-"+(data.class==Museo ? "M" :"I"), :name => mar.nombre, :values=>dameValuesMuseos(mar)+dameValuesGenericas(mar)} }
    
  end
  def dameValuesMuseos mar
    mar.fichas.map { |child| {:name=>child.museo.nombre,:id=>child.museo.id.to_s+"-M"}}
  end
  def dameValuesGenericas mar
    mar.genericas.map { |child| {:name=>child.titulo,:id=>child.id.to_s+"-I"}}
  end
end
end