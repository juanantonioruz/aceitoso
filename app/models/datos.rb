include ActionView::Helpers::AssetTagHelper

class Datos
    include ApplicationHelper

  attr_accessor   :data, :resultado_html, :coordenadas, :clase, :point
  
  def initialize
    @museos_hitos_rutas_implicitos=[]
    
  end
  def dameNombre
    if [Museo].include? self.data.class then
      self.data.nombre_relacionable
    elsif [Pieza, Hito, Camino].include? self.data.class then
      self.data.nombre_relacionable
    else
      self.data.nombre_relacionable
    end
  end
    def as_json(options = {})
    {
    :data=>{
    :attributes=>  dameAtributos,
    :name=>dameNombre ,
    :id=>self.data.predecessor.id.to_s
    },
    :details_html=>dameDetails, 
    :coords=>dameCoordenadas,
    :clasi=>self.clase,
    :rutas=>dameRutasDeDato


    }
  end
  
  def dameRutasDeDato
    if self.data.class==Museo 
      dameRutas(self.data) 
    elsif self.data.class==Camino
            dameRutasCamino(self.data) 
    elsif self.data.class==Hito
            dameRutas(self.data.entorno.museo) 
    else
      ""
      end
  end
   def dameRutas museo
        
       museo.caminos.map{|k|  {:nombre => k.nombre, :archivo => k.archivo.to_s}}
  end
   def dameRutasCamino k
        
      [{:nombre => k.nombre, :archivo => k.archivo.to_s}]
      
  end
  def dameCoordenadas
    if self.data.class==Museo then
      devuelveCoordenadasSiExisten self.data.ficha
    elsif self.data.class==Hito then
      devuelveCoordenadasSiExisten self.data.entorno.museo.ficha
    elsif self.data.class==Camino then
      devuelveCoordenadasSiExisten self.data.entorno.museo.ficha
    elsif self.data.class==Pieza then
      devuelveCoordenadasSiExisten self.data.museo.ficha
    elsif self.data.class==Espacio then
      devuelveCoordenadasSiExisten self.data.museo.ficha
    elsif self.data.class==Evento then
      devuelveCoordenadasSiExisten self.data.museo.ficha
    elsif self.data.class==Generica then
      if !self.point.nil? then
        self.point.gsub(",","x")
        else
    ""
      end
    else 
      ""
    end
     
  end
  
  def devuelveCoordenadasSiExisten objCoordenadas
    if !objCoordenadas.x.blank? then
        objCoordenadas.x+"x"+objCoordenadas.y
      end
  end
  
  def dameTabNew titulo
     return "<dt > #{titulo}  </dt> <dd>"
  end
  
  def finTab
    return "<br> </dd>"
  end
  
  def dameDetails
    titulo="<h1>#{self.data.nombre_relacionable}</h1>"
    respuesta_det=titulo
    respuesta_det<<"<p class='summary'>"
    if (self.data.class==Museo) then
          respuesta_det<<"<dl>" 
          respuesta_det<< dameTabNew('Descripci&oacute;n')
        respuesta_det<<imagen_details(self.data.ficha.imagen) unless self.data.ficha.imagen.blank?
          respuesta_det<<"#{texto_con_enlaces(self.data.ficha.descripcion)}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Contacto")
          respuesta_det<<"#{self.data.ficha.contacto}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Como llegar...")
          respuesta_det<<"#{self.data.ficha.llegar}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Horarios y tarifas")
          respuesta_det<<"#{self.data.ficha.horario}" 
          respuesta_det<<finTab
          if(!self.data.servicios.empty?)
          respuesta_det<<dameTabNew("Servicios")
            self.data.servicios.each do |servicio|
              respuesta_det<<"<img src='#{servicio.imagen}' style='vertical-align: middle;margin-right:5px;'><b>#{servicio.service.descripcion}</b><br>#{servicio.descripcion}<br>" 
            end
          respuesta_det<<finTab
        end
          if(!self.data.espacios.empty?)
          respuesta_det<<dameTabNew("Espacios")
            self.data.espacios.each do |espacio|
#        respuesta_det<<imagen_details(espacio.imagen) unless espacio.imagen.blank?

              respuesta_det<<"<br><b>#{espacio.nombre}</b><br>#{espacio.descripcion.html_safe}<br><hr>" 
            end
          respuesta_det<<finTab
        end
          if(!self.data.medios.empty?)
          respuesta_det<<dameTabNew("Audiovisuales")
            self.data.medios.each do |medio|
              respuesta_det<<"<br><b class='medio_popup' id_medio='#{medio.id}'>#{medio.nombre}</b><br><hr>" 
            end
          respuesta_det<<finTab
        end
          if(!self.data.eventos.empty?)
         respuesta_det<< dameTabNew("Historia")
         self.data.eventos.each do |evento|
          respuesta_det<<imagen_details(evento.imagen) unless evento.imagen.blank?
          respuesta_det<<"<br><b>#{evento.titulo}</b>"
          respuesta_det<<"#{evento.descripcion.html_safe}<br><hr>"
          end
          respuesta_det<<finTab
        end
          if(!self.data.publicacions.empty?)
          respuesta_det<<dameTabNew("Publicaciones")
            self.data.publicacions.each do |publicacion|
              respuesta_det<<"<b>#{publicacion.nombre}</b><br>#{publicacion.descripcion}"
              if !(publicacion.url=="" || publicacion.url=="http://") then respuesta_det<<"<br><a href='#{(publicacion.url)}'>#{(publicacion.url)}</a>" end 
          respuesta_det<<"<hr>"
            end
          respuesta_det<<finTab
            end
             if(!self.data.premios.empty?)
       respuesta_det<<dameTabNew("Premios")
            self.data.premios.each do |premio|
              respuesta_det<<"<b>#{premio.nombre}</b><br>#{premio.descripcion}<br>#{(premio.url)}" 
            end

          respuesta_det<<finTab
        end
    
          self.data.varios.each do |vario|
            respuesta_det<<dameTabNew(vario.nombre)
              respuesta_det<<"#{vario.descripcion.html_safe}" 
            respuesta_det<<finTab
          end

      

          respuesta_det<<"</dl>" 

else
   if (Hito==self.data.class)
        respuesta_det<<imagen_servicio(self.data.imagen_servicio) unless self.data.imagen_servicio.blank?
      end
   if ([Pieza, Generica, Hito, Camino, Espacio].include?self.data.class)
        respuesta_det<<imagen_details(self.data.imagen) unless self.data.imagen.blank?
      end
      if(self.data.descripcion.blank?)
          respuesta_det<<"Actualmente no hay descripcion para este tema"
    else
    respuesta_det<<texto_con_enlaces(self.data.descripcion) 
      end
  end
      respuesta_det<<"</p>"
    respuesta_det
   end
  
  def imagen_details url
   "<div style='margin-bottom:5px;width:250;'><img class='summary-img' width='250' style='border:1px solid gray' src='#{url}'></div>"   
  end
  def imagen_servicio url
   "<img class='summary-img'   src='#{url}'><br><br>"   
  end
  def llena_destinos mapa
                 puts "llllllllllllenando destinos mapa"
   self.data.relaciones_fin.each do |rel| 
          nombre="#{dameNombreRelacionDestino(rel)}xxx#{rel.fin.id}" 
          if [Museo, Hito, Camino].include? rel.origen.heir.class then
            @museos_hitos_rutas_implicitos <<rel.origen
          end

        if !mapa.key?nombre then 
          mapa[nombre]=[rel.origen] 
        else
          mapa[nombre] << rel.origen 
        end 
        end

end

def check_mapa_key mopa, nombre
  existe=false
  puts "------------" 
  mopa.each do |c,v| 
  clave_p=c.split("xxx")[0].gsub(/\s+/, "")
  nombre_p= nombre.split("xxx")[0].gsub(/\s+/, "")

  if clave_p==nombre_p then existe=true end
  end
  puts mopa 
  puts existe 
  puts "------------" 
  return existe
end

 def dameNombreRelacion rel
    if rel.sentido_relacion.creciente.to_s=="1"
      return rel.sentido_relacion.nombre_relacion.nombre1
      else
    return rel.sentido_relacion.nombre_relacion.nombre2
    end
    
  end
  def dameNombreRelacionDestino rel
    return rel.sentido_relacion.titulo_destino_desde_destino
    end
  def llena mapa
            #puts "llllllllllllenando mapa"
        self.data.relaciones_origen.each do |rel| 
          nombre="#{dameNombreRelacion(rel)}xxx#{rel.origen.id}"
            #          puts "llllllllllllenando mapa #{rel.origen.nombre_select}"+rel.sentido_relacion.nombre_relacion.id.to_s+"----"+rel.sentido_relacion.creciente.to_s+"-- "+nombre+" #{rel.fin.nombre_select}"

          if [Museo, Hito, Camino].include? rel.fin.heir.class then
            @museos_hitos_rutas_implicitos<< rel.fin
          end
          if !mapa.key?nombre then 
            mapa[nombre]=[rel.fin] 
          else
            mapa[nombre] << rel.fin 
          end 
        end

  end
  def llenaMuseo mapa
        self.data.piezas.each{|pieza| nombre="Piezas Relacionadasxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[pieza.predecessor] else mapa[nombre] << pieza.predecessor end }
        if !self.data.entorno.blank? then
          self.data.entorno.caminos.each do |camino| 
          if !@museos_hitos_rutas_implicitos.include? camino.predecessor

            nombre="Rutas Relacionadasxxxxxx#{self.data.id}" 
             if !mapa.key?nombre then 
               mapa[nombre]=[camino.predecessor] 
           else
             mapa[nombre] << camino.predecessor 
             end 
          end
          end
          self.data.entorno.hitos.each do |hito| 
            if !@museos_hitos_rutas_implicitos.include? hito.predecessor
            nombre="Hitos Relacionadasxxxxxx#{self.data.id}" 
             if !mapa.key?nombre then 
               mapa[nombre]=[hito.predecessor] 
              else
             mapa[nombre] << hito.predecessor 
           end
           end
          end
        end 
        self.data.espacios.each{|espacio| nombre="Espacios Visitablesxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[espacio.predecessor] else mapa[nombre] << espacio.predecessor end }
        self.data.eventos.each{|evento| nombre="Historiaxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[evento.predecessor] else mapa[nombre] << evento.predecessor end }
        self.data.infos.each{|ri| nombre="Info Museograficaxxxxxx#{self.data.id}" and if(!ri.generica.nil?) then if (!mapa.key?nombre ) then mapa[nombre]=[ri.predecessor] else mapa[nombre] << ri.predecessor end end }
        #self.data.espacios.each{|espacio| nombre="Espacios Relacionadasxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[espacio] else mapa[nombre] << espacio end }

  end
  def llenaPieza mapa
         nombre="Se expone enxxx#{self.data.museo.predecessor.id}"
         Rails.logger.warn nombre+" llllllllllll"
         mapa[nombre] = [self.data.museo.predecessor] 
        self.data.genericas.each{|generica| nombre="Articulos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[generica.predecessor] else mapa[nombre] << generica.predecessor end }

  end
  def llenaCamino mapa
            if !@museos_hitos_rutas_implicitos.include? self.data.entorno.museo.predecessor

         nombre="Cerca dexxx#{self.data.entorno.museo.predecessor.id}"

         mapa[nombre] = [self.data.entorno.museo.predecessor] 
         end
        self.data.genericas.each{|generica| nombre="Articulos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[generica.predecessor] else mapa[nombre] << generica.predecessor end }

  end
  def llenaHito mapa
            if !@museos_hitos_rutas_implicitos.include? self.data.entorno.museo.predecessor
         nombre="Cerca dexxx#{self.data.entorno.museo.predecessor.id}"
         mapa[nombre] = [self.data.entorno.museo.predecessor] 
         end
        self.data.genericas.each{|generica| nombre="Articulos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[generica.predecessor] else mapa[nombre] << generica.predecessor end }

  end
  def llenaEspacio mapa
         nombre="En museoxxx#{self.data.museo.predecessor.id}"
         Rails.logger.warn nombre+" espacio"
         mapa[nombre] = [self.data.museo.predecessor] 

  end
  def llenaEvento mapa
         nombre="En museoxxx#{self.data.museo.predecessor.id}"
         Rails.logger.warn nombre+" evento"
         mapa[nombre] = [self.data.museo.predecessor] 

  end
  def llenaInfo mapa
         nombre="Recurso dexxx#{self.data.museo.predecessor.id}"
         Rails.logger.warn nombre+" info"
         mapa[nombre] = [self.data.museo.predecessor] 

  end
  def llenaGenerica mapa
        self.data.piezas.each{|pieza| nombre="Piezas Relacionadasxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[pieza.predecessor] else mapa[nombre] << pieza.predecessor end }
        self.data.caminos.each{|camino| nombre="Rutas Relacionadasxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[camino.predecessor] else mapa[nombre] << camino.predecessor end }
        self.data.hitos.each{|hito| nombre="Hitos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[hito.predecessor] else mapa[nombre] << hito.predecessor end }
        self.data.infos.each{|info| nombre="Es recurso int. xxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[info.museo.predecessor] else mapa[nombre] << info.museo.predecessor end }

  end
 
  def dameAtributos
#    if self.data.class==Museo
#      value=self.data.ficha
#    else
#      value=self.data
#    end
#    tanto museo como generica son relacionables ...
    mapa=Hash.new
    llena mapa
    llena_destinos mapa
    if self.data.class==Museo then llenaMuseo mapa end
    if self.data.class==Pieza then llenaPieza mapa end
    if self.data.class==Camino then llenaCamino mapa end
    if self.data.class==Hito then llenaHito mapa end
    if self.data.class==Espacio then llenaEspacio mapa end
    if self.data.class==Evento then llenaEvento mapa end
    if self.data.class==Info then llenaInfo mapa end
    if self.data.class==Generica then llenaGenerica mapa end
    
     mapa.map{|k,v|  {:id => k.split("xxx")[1], :name => k.split("xxx")[0], :values=>dameValuesRelacionables(v) }}
     
    #mapa.each { |atr|  {:id => atr.to_s, :name => atr, :values=>dameValuesRelacionables(mapa[atr]) } }
    # por cada atributo obtener los relacionables
    # el atributo es el nombre1 o nombre2 de la relacion.sentido_relacion.nombre_relacion segun su valor creciente del sentido
    
    
    #  atributos.each{|atri| }
    #value.labels.map { |mar| {:id => mar.id.to_s, :name => mar.nombre, :values=>dameValuesMuseos(mar)+dameValuesGenericas(mar)} }
    
  end
  
   def dameValuesRelacionables lista
     ## esto es una chapuza llamar relacionable al espacio que por ahora no lo es.. .
    lista.map { |relacionable| {:name=>if  relacionable.class==Espacio then relacionable.nombre_ask elsif relacionable.heir.class==Info then relacionable.heir.tipo_ri.capitalize+": "+relacionable.heir.nombre_ask else relacionable.heir.nombre_ask end ,:id=>if  relacionable.class==Espacio then relacionable.heir.generica.predecessor.id else relacionable.id end}}
  end
  
 
  
  def coincide nombre_atributo, relacion, relaciones
      relaciones.each{|rel| dameNombreRelacion rel unless relacion==rel}
  end
  
  def dameValuesMuseos mar
    mar.fichas.map { |child| {:name=>child.museo.nombre,:id=>child.museo.id.to_s+"-M"}}
  end
  def dameValuesGenericas mar
    mar.genericas.map { |child| {:name=>child.titulo,:id=>child.id.to_s+"-I"}}
  end
end