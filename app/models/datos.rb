class Datos

  attr_accessor   :data, :resultado_html, :coordenadas, :clase
  def dameNombre
    if [Museo].include? self.data.class then
      self.data.nombre_select
    elsif [Pieza, Hito, Camino].include? self.data.class then
      self.data.nombre_select
    else
      self.data.nombre_select
    end
  end
    def as_json(options = {})
    {
    :data=>{
    :attributes=>  dameAtributos,
    :name=>dameNombre ,
    :id=>self.data.id.to_s
    },
    :details_html=>dameDetails, 
    :coords=>(self.data.class==Museo and !self.data.ficha.x.blank?)? self.data.ficha.x+"x"+self.data.ficha.y : "",
    :clasi=>self.clase,
    :rutas=>(self.data.class==Museo)?dameRutas(self.data) :""


    }
  end
  
  def dameTabNew titulo
     "<dt ><h2 style='background-color:#003A6B; color:white;'>#{titulo}</h2></dt><dd>"
  end
  
  def finTab
    "<br></dd>"
  end
  
  def dameDetails
    titulo="<h1>#{self.data.nombre_relacionable}</h1>"
    respuesta_det=titulo
    respuesta_det<<"<p class='summary'>"
    if (self.data.class==Museo) then
          respuesta_det<<"<dl>" 
          respuesta_det<<dameTabNew("Descripcion")
        respuesta_det<<imagen_details(self.data.ficha.imagen) unless self.data.ficha.imagen.blank?
          respuesta_det<<"#{self.data.ficha.descripcion}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Contacto")
          respuesta_det<<"#{self.data.ficha.contacto}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Como llegar...")
          respuesta_det<<"#{self.data.ficha.contacto}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Horario")
          respuesta_det<<"#{self.data.ficha.horario}" 
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Servicios")
            self.data.servicios.each do |servicio|
              respuesta_det<<"#{servicio.descripcion}<br>" 
            end
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Publicaciones")
            self.data.publicacions.each do |publicacion|
              respuesta_det<<"<b>#{publicacion.nombre}</b><br>#{publicacion.descripcion}<br>#{(publicacion.url)}" 
            end
          respuesta_det<<finTab
          respuesta_det<<dameTabNew("Premios")
            self.data.premios.each do |premio|
              respuesta_det<<"<b>#{premio.nombre}</b><br>#{premio.descripcion}<br>#{(premio.url)}" 
            end

          respuesta_det<<finTab

          respuesta_det<<"</dl>" 

else
   if ([Pieza, Generica, Hito, Camino].include?self.data.class)
        respuesta_det<<imagen_details(self.data.imagen) unless self.data.imagen.blank?
        end
          respuesta_det<<self.data.descripcion 
  end
      respuesta_det<<"</p>"
    respuesta_det
   end
  
  def imagen_details url
   "<img class='summary-img' width='150' src='#{url}'>"   
  end
  
  def llena mapa
        self.data.relaciones_origen.each{|rel| nombre="#{dameNombreRelacion(rel)}xxx#{rel.origen.id}" and if !mapa.key?nombre then mapa[nombre]=[rel.fin] else mapa[nombre] << rel.fin end }

  end
  def llenaMuseo mapa
        self.data.piezas.each{|pieza| nombre="Piezas Relacionadasxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[pieza.predecessor] else mapa[nombre] << pieza.predecessor end }
        self.data.entorno.caminos.each{|camino| nombre="Rutas Relacionadasxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[camino.predecessor] else mapa[nombre] << camino.predecessor end }
        self.data.entorno.hitos.each{|hito| nombre="Hitos Relacionadasxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[hito.predecessor] else mapa[nombre] << hito.predecessor end }
        self.data.espacios.each{|espacio| nombre="Espacios Visitablesxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[espacio.predecessor] else mapa[nombre] << espacio.predecessor end }
        self.data.eventos.each{|evento| nombre="Historiaxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[evento.predecessor] else mapa[nombre] << evento.predecessor end }
        self.data.infos.each{|ri| nombre="Recursos Interpretativosxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[ri.generica.predecessor] else mapa[nombre] << ri.generica.predecessor end }
        #self.data.espacios.each{|espacio| nombre="Espacios Relacionadasxxxxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[espacio] else mapa[nombre] << espacio end }

  end
  def llenaPieza mapa
         nombre="Se expone enxxx#{self.data.museo.predecessor.id}"
         Rails.logger.warn nombre+" llllllllllll"
         mapa[nombre] = [self.data.museo.predecessor] 
        self.data.genericas.each{|generica| nombre="Articulos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[generica.predecessor] else mapa[nombre] << generica.predecessor end }

  end
  def llenaCamino mapa
         nombre="Cerca dexxx#{self.data.entorno.museo.predecessor.id}"
         Rails.logger.warn nombre+" camino"
         mapa[nombre] = [self.data.entorno.museo.predecessor] 
        self.data.genericas.each{|generica| nombre="Articulos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[generica.predecessor] else mapa[nombre] << generica.predecessor end }

  end
  def llenaHito mapa
         nombre="Cerca dexxx#{self.data.entorno.museo.predecessor.id}"
         Rails.logger.warn nombre+" hito"
         mapa[nombre] = [self.data.entorno.museo.predecessor] 
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
  def llena_destinos mapa
        self.data.relaciones_fin.each{|rel| nombre="#{dameNombreRelacionDestino(rel)}xxx#{rel.fin.id}" and if !mapa.key?nombre then mapa[nombre]=[rel.origen] else mapa[nombre] << rel.origen end }

  end
  def dameRutas museo
        
       museo.caminos.map{|k|  {:nombre => k.nombre, :archivo => k.archivo.to_s}}
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
    lista.map { |relacionable| {:name=>if  relacionable.class==Espacio then relacionable.nombre_ask else relacionable.heir.nombre_ask end ,:id=>relacionable.id}}
  end
  
  def dameNombreRelacion rel
    if rel.sentido_relacion.creciente
      rel.sentido_relacion.nombre_relacion.nombre1 
    else
    rel.sentido_relacion.nombre_relacion.nombre2 
    end
    
  end
  def dameNombreRelacionDestino rel
    rel.sentido_relacion.titulo_destino_desde_destino
    
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