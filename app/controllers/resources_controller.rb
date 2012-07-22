  include ActionView::Helpers::SanitizeHelper
class ResourcesController < ApplicationController
  layout 'application'
   require 'csv'
   require 'cgi'
         require 'nokogiri'


  


  def medio
             

     render :text =>  Medio.find(params[:id]).descripcion.html_safe
end

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

  def museostextfile
    v="id|point|title|description|icon|iconOffset|iconSize".split("|").join("\t")+"\n"
      museos=Museo.find(:all)
      id=params[:id]
      
      id_arra=Array.new
      if(!id.nil?) then
              logger.warn "#{id} ----------------------------"
              logger.warn "#{id[0]} ----------------------------"
              
        caracter=id.split("-")[0]      
        numero=id.split("-")[1]      
              logger.warn "#{caracter} #{numero} ----------------------------"

        if (caracter=="g") then 
        Relacionable.find(numero).heir.piezas.each{|pieza| id_arra << pieza.museo.predecessor.id.to_s}
        logger.warn "#{id_arra} ----------------------------"

      elsif (caracter=="i") then
        
        Relacionable.find(numero).heir.generica.piezas.each{|pieza| id_arra << pieza.museo.predecessor.id.to_s}
      elsif (caracter=="h") then
        id_arra<<Relacionable.find(numero).heir.entorno.museo.predecessor.id.to_s
      elsif (caracter=="c") then
        id_arra<<Relacionable.find(numero).heir.entorno.museo.predecessor.id.to_s
      elsif (caracter=="p") then
        id_arra<<Relacionable.find(numero).heir.museo.predecessor.id.to_s
      elsif (caracter=="e") then
        id_arra<<Relacionable.find(numero).heir.museo.predecessor.id.to_s
      elsif (caracter=="t") then
        id_arra<<Relacionable.find(numero).heir.museo.predecessor.id.to_s
      else
        id_arra<<id
        end
      end
museo_se=""
   for museo in museos do 
        if id_arra.include? museo.predecessor.id.to_s then
          museo_se=museo_cvs(museo,true)
          else
          ne=museo_cvs(museo,false)
          v+=ne
          end 
        
          v+=museo_se
    
  end
  if(museo_se!="") then v+=museo_se end
     render :text => v.html_safe 
  end
  
  def museo_cvs(museo, sel)
            ficha=museo.ficha
    
    return "#{museo.predecessor.id}|#{ficha.x},#{ficha.y}|#{museo.nombre}|#{resumenInfoHTML(ficha.descripcion)}|#{dameIcoMuseo(sel)}|#{dameIcoOffsetMuseo(sel)}|#{dimensionIco(sel)}".split("|").join("\t")+"\n"
  end
  
  def resumenInfoHTML info
    sanitize(info.gsub(/\n/, ""),:tags=>[])[0,130]+"..."
  end
  
  def hitotextf
        hitito=Relacionable.find(params[:id]).heir
    puts "hitohito#{hitito}"
    v="id|point|title|description|icon|iconOffset|iconSize".split("|").join("\t")+"\n"
           for hito in hitito.entorno.hitos do 

        point=damePointHito hito
        sel=hito==hitito
        v+="#{hito.predecessor.id}|#{point}|#{hito.nombre}|#{resumenInfoHTML(hito.descripcion)}|#{dameIcoHito(hito)}|#{dameIcoOffsetMuseo(sel)}|#{dimensionIco(sel)}".split("|").join("\t")+"\n"
        end
         render :text => v.html_safe 

  end
  def hitotextfg
        generica=Relacionable.find(params[:id]).heir
    v="id|point|title|description|icon|iconOffset|iconSize".split("|").join("\t")+"\n"
        point=check_kml generica
        sel=false
        v+="#{generica.predecessor.id}|#{point}|#{generica.titulo}|#{resumenInfoHTML(generica.descripcion)}|#{dameIcoGenerica}|#{dameIcoOffsetMuseo(sel)}|#{dimensionIco(sel)}".split("|").join("\t")+"\n"
         render :text => v.html_safe 

  end
  def hitostextfile
    museo=Relacionable.find(params[:id]).heir
    v="id|point|title|description|icon|iconOffset|iconSize".split("|").join("\t")+"\n"
        ficha=museo.ficha
 #   v+=ne
     for hito in museo.hitos do
        point=damePointHito hito
        v+="#{hito.predecessor.id}|#{point}|#{hito.nombre}|#{resumenInfoHTML(hito.descripcion)}|#{dameIcoHito(hito)}|#{dameIcoOffsetMuseo(false)}|#{dimensionIco(false)}".split("|").join("\t")+"\n"
     end
  
     render :text => v.html_safe 
  end
  
  
  def camino
    url=params[:url]
        url.gsub!(/qqq/, "/")
      puts url+"pppppppppppppppppppppppppppppppppppppppppppppppppppppppp"
      if(request.domain=="localhost") then
              doc = Nokogiri::XML(open("http://"+request.domain+":"+request.port.to_s+url))
              else
             doc = Nokogiri::XML(open("http://www.museos.olearum.es/"+url))
         end
         send_file doc
         end
  
  
  def check_kml elemento_con_kml
    if (!elemento_con_kml.archivo.blank?) then
         begin
              if(request.domain=="localhost") then
              doc = Nokogiri::XML(open("http://"+request.domain+":"+request.port.to_s+elemento_con_kml.archivo.to_s))
              else
             doc = Nokogiri::XML(open("http://www.museos.olearum.es/"+elemento_con_kml.archivo.to_s))
               end
          point="#{doc.at_css("latitude").content},#{doc.at_css("longitude").content}"

        rescue
          puts "Error leyendo el doc!"
          end
      end 
  end
  def damePointHito hito
     point="#{hito.x},#{hito.y}"
     
      elemento_con_kml=hito
      point_kml=check_kml elemento_con_kml
      if !point_kml.nil? then point=point_kml end 
       
      return point
  end
  
  def dameIcoMuseo seleccionado
    if(seleccionado) then return dameIcoMuseoSeleccionado end
          return "/uploads/service/imagen/26/museum_industry.png"
  end
  def dameIcoOffsetMuseo seleccionado
    if(seleccionado) then return "-20,-46" end
          return "-16,-37"
  end
  def dameIcoMuseoSeleccionado
          return "/images/museo_seleccionado.gif"
  end
  def dimensionIco amplia
    if amplia then
          return "40,46"
      else
          return "32,37"
        
        end

end

  def dameIcoGenerica
    return "/uploads/service/imagen/6/17_jardindevariedades.png"
    
  end
  def dameIcoHito(hito)
    if(hito.service.nil?) then
    return "/uploads/service/imagen/6/17_jardindevariedades.png"
  else
    return hito.imagen_servicio
    end
  end
  
  def dameIcoBis
  @contador=Random.rand(2)
    if ((@contador.divmod(2)[1])==0)
      return "http://openlayers.org/dev/examples/img/check-round-green.png"
    else
      return "http://openlayers.org/dev/examples/img/mobile-layers.png"
      
    end
    @contador=@contador+1
  end
  def text_cvs vv
    vv.split().each do |csv|
     if csv =~ /\A".*"\z/m then csv.gsub!(/\A"(.*)"\z/m, '\1') end  # remove double-quotes at string beginning & end
    end
   vv
  end

  #este metodo es invocado por el suggest del interactivo
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
     @resource_caminos= Camino.where(["nombre LIKE ?", "%"+query+"%"])
     @resource_hitos= Hito.where(["nombre LIKE ?", "%"+query+"%"])

    @resource_museos_desc=  Museo.find(:all, :joins=>:ficha, :conditions=>["nombre NOT LIKE :consulta and fichas.descripcion  LIKE :consulta",{:consulta=> "%"+query+"%"}])
    @resource_genericas_desc=  Generica.find(:all,  :conditions=>["titulo NOT LIKE :consulta and descripcion  LIKE :consulta",{:consulta=> "%"+query+"%"}])
    @resource_caminos_desc=  Camino.find(:all,  :conditions=>["nombre NOT LIKE :consulta and descripcion  LIKE :consulta",{:consulta=> "%"+query+"%"}])
    @resource_hitos_desc=  Hito.find(:all,  :conditions=>["nombre NOT LIKE :consulta and descripcion  LIKE :consulta",{:consulta=> "%"+query+"%"}])

    
    data=DatosSearch.new
#    data.resultado_html="202"
     data.data_museos=@resource_museos
     data.data_genericas=@resource_genericas
     data.data_caminos=@resource_caminos
     data.data_hitos=@resource_hitos
     
     data.data_museos_desc=@resource_museos_desc
     data.data_genericas_desc=@resource_genericas_desc
     data.data_caminos_desc=@resource_caminos_desc
     data.data_hitos_desc=@resource_hitos_desc
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

  #este metodo es invocado por el suggest para detallar info en mouse-over ... ahora no anda...
  def fly

        logger.info "consulta suggest por mid > id .... "+params[:id].to_s
      
      resultado, html=busca(params[:id])      
      if html.nil? then html="sin info" end
     #   logger.info museo.ficha.descripcion
      respuesta ='/** this is jsonp **/ '+params[:callback].to_s+'({"id":"'+resultado.id.to_s+'","html":"<div class=\"fbs-flyout-content\">'+html.gsub(/\"/,'\'')+'</div>"});'
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
      if resultado.class.to_s=="Generica"
        punto_kml=check_kml resultado
          if(!punto_kml.nil?)
        data.point=punto_kml
        end
      end
    data.data=@resource
    data.clase= resultado.class.to_s
    logger.info "clase:"+data.clase.to_s
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