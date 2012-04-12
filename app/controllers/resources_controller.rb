class ResourcesController < ApplicationController
  layout 'application'

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