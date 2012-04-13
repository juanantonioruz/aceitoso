class ResourcesController < ApplicationController
  layout 'application'

  def search
        logger.info "search::: > buscando .... "+params[:query].to_s

      respuesta='/* this is javascript */ '+params[:callback].to_s+'({"status":"200 OK",
      "result":[
      {"mid":"/m/077qn",
      "name":"Serbia",
      "notable":{"name":"Country","id":"/location/country"},
      "lang":"en",
      "score":71.716133
      },{"mid":"/m/0d9jr","name":"Seattle","notable":{"name":"City/Town/Village","id":"/location/citytown"},"lang":"en","score":71.649063},{"mid":"/m/06ng1","name":"Sex","notable":{"name":"Route of infection transmission","id":"/medicine/transmission_route"},"lang":"en","score":64.541069},{"mid":"/m/0hsqf","name":"Seoul","notable":{"name":"City/Town/Village","id":"/location/citytown"},"lang":"en","score":63.484711},{"mid":"/m/06srk","name":"Senegal","notable":{"name":"Country","id":"/location/country"},"lang":"en","score":62.349876},{"mid":"/m/070xg","name":"Seattle Seahawks","notable":{"name":"American football team","id":"/american_football/football_team"},"lang":"en","score":60.330681},{"mid":"/m/09f3c","name":"Seville","notable":{"name":"City/Town/Village","id":"/location/citytown"},"lang":"en","score":59.434868},{"mid":"/m/04jpl","name":"London","notable":{"name":"Railway terminus","id":"/rail/railway_terminus"},"lang":"en","score":58.766258},{"mid":"/m/06p8m","name":"Sega","notable":{"name":"Organization","id":"/organization/organization"},"lang":"en","score":57.999702},{"mid":"/m/025sf8g","name":"Selenium","notable":{"name":"Chemical Element","id":"/chemistry/chemical_element"},"lang":"en","score":57.965519},{"mid":"/m/06sw9","name":"Seychelles","notable":{"name":"Country","id":"/location/country"},"lang":"en","score":57.842812},{"mid":"/m/021mp2","name":"Sedan","notable":{"name":"Body Style","id":"/automotive/body_style"},"lang":"en","score":56.666691},{"mid":"/m/06nwz","name":"Seafood","notable":{"name":"Cuisine","id":"/food/cuisine"},"lang":"en","score":56.549774},{"mid":"/m/0f3vz","name":"Seine","notable":{"name":"Body Of Water","id":"/geography/body_of_water"},"lang":"en","score":55.925282},{"mid":"/m/06nxt","name":"Second","notable":{"name":"Unit Of Time","id":"/measurement_unit/time_unit"},"lang":"en","score":55.326965},{"mid":"/m/072kp","name":"Seinfeld","notable":{"name":"TV Program","id":"/tv/tv_program"},"lang":"en","score":54.893318},{"mid":"/m/01vsykc","name":"Seal","notable":{"name":"Musician","id":"/m/09jwl"},"lang":"en","score":54.657032},{"mid":"/m/073z8","name":"Serotonin","notable":{"name":"Chemical Compound","id":"/chemistry/chemical_compound"},"lang":"en","score":54.299114},{"mid":"/m/09dh0","name":"Seed","notable":{"name":"Industry","id":"/business/industry"},"lang":"en","score":53.546150},{"mid":"/m/06_4g","name":"Sejm","notable":{"name":"Governmental Body","id":"/government/governmental_body"},"lang":"en","score":53.515915}],"cursor":20,"cost":27,"hits":56662});'
            render :text => respuesta
  end
  
  def fly
        logger.info "consulta suggest por mid > id .... "+params[:id].to_s
      respuesta ='/** this is jsonp **/ '+params[:callback].to_s+'({"id":"/m/077qn",\
      "html":"aqui esta la respuesta html"
      });'
                render :text => respuesta

  end

  def show
    logger.info "es menor que 500 .... "+params[:id].to_s
#    if(!params[:id].nil? ) then  
#    @resource=Marron.find_by_id(params[:id])
#    logger.info @resource
#    logger.info @resource.children
#    data=Datos.new
#    data.resultado="202"
#    data.data=@resource
    
  #  data.resultado_html="<h2>Porsche</h2>\n<p class='summary'>\n<img class='summary-img' src='http://img.freebase.com/api/trans/image_thumb//m/029j0m8?mode=fit&amp;maxwidth=150'>\nPorsche Automobil Holding SE, usually shortened to Porsche SE (German pronunciation: [\u02c8p\u0254\u0281\u0283\u0259]) a Societas Europaea or European Public Company, is a German holding company with investments in the automotive industry.\nPorsche SE is headquartered in Zuffenhausen, a city district of Stuttgart, Baden-W\u00fcrttemberg and is owned by the Pi\u00ebch and Porsche families, and Qatar Holdings, through the Qatar Investment Authority (10%). It owns 50.7% of Volkswagen AG and 50.1% of Porsche Zwischenholding GmbH,...\n[\n<a href='http://freebase.com/view/en/porsche' target='_new'>Freebase Topic</a>\n|\n&nbsp;\n<a href='http://en.wikipedia.org/w/index.php?curid=24365' target='_new'>Wikipedia Article</a>\n]\n<h3>Links</h3>\n<ul class='links'>\n<li>\n<a href='http://www.porsche.com/' target='_new'></a>\n</li>\n<li>\n<a href='http://topics.nytimes.com/top/news/business/companies/porsche_ag/index.html' target='_new'></a>\n</li>\n<li>\n<a href='http://www.porsche-se.com/pho/en/' target='_new'></a>\n</li>\n<li>\n<a href='http://www.honk.com/porsche' target='_new'></a>\n</li>\n<li>\n<a target='_new'></a>\n</li>\n<li>\n<a target='_new'></a>\n</li>\n<li>\n<a target='_new'></a>\n</li>\n<li>\n<a target='_new'></a>\n</li>\n<li>\n<a href='http://www.porsche.com' target='_new'></a>\n</li>\n</ul>\n</p>\n"
   # data.resultado_html="los detalles html"
     respond_to do |format|
 format.html # show.html.erb
 format.json {render :text => '{"data":{"attributes":[{"values":[{"name":"Ferdinand Porsche","id":"/en/ferdinand_porsche"}],"name":"Founders","id":"/organization/organization/founders"},{"values":[],"name":"Headquarters","id":"/organization/organization/headquarters"},{"values":[{"name":"Automobile","id":"/en/automobile"}],"name":"Industry","id":"/business/business_operation/industry"},{"values":[],"name":"Equivalent Instances","id":"/base/ontologies/ontology_instance/equivalent_instances"},{"values":[],"name":"Employees and other personnel","id":"/business/employer/employees"},{"values":[{"name":"Porsche 911","id":"/en/porsche_911"},{"name":"Porsche","id":"/m/0h5wrrb"}],"name":"Make(s)","id":"/automotive/company/make_s"}],"name":"Porsche","id":"/en/porsche"},"details_html":"details"}'}
 #format.json {render :json =>data.to_json( ) }
#end
end
end
class Datos
  attr_accessor :resultado, :data, :resultado_html
    def as_json(options = {})
    {
    :data=>{
    :attributes=>  self.data.children.map { |mar| {:id => mar.id.to_s, :name => mar.titulo, :values=>mar.children.map { |child| {:name=>child.titulo,:id=>child.id.to_s}}} },
    :name=>self.data.titulo,
    :id=>self.data.id.to_s
    },
    :details_html=>self.data.descripcion


    }
  end

end
end