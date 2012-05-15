class Datos
  attr_accessor   :data, :resultado_html, :coordenadas
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
    :id=>self.data.predecessor.id.to_s
    },
    :details_html=>dameDetails, 
    :coords=>(self.data.class==Museo and !self.data.ficha.x.blank?)? self.data.ficha.x+"x"+self.data.ficha.y : ""


    }
  end
  
  def dameDetails
    titulo="<h1>#{self.data.nombre_relacionable}</h1>"
    respuesta_det=titulo
    respuesta_det<<"<p class='summary'>"
    if (self.data.class==Museo) then
        respuesta_det<<imagen_details(self.data.ficha.imagen) unless self.data.ficha.imagen.blank?
          respuesta_det<<self.data.ficha.descripcion 

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
  def llenaGenerica mapa
        self.data.piezas.each{|pieza| nombre="Piezas Relacionadasxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[pieza.predecessor] else mapa[nombre] << pieza.predecessor end }
        self.data.caminos.each{|camino| nombre="Rutas Relacionadasxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[camino.predecessor] else mapa[nombre] << camino.predecessor end }
        self.data.hitos.each{|hito| nombre="Hitos relacionadosxxx#{self.data.id}" and if !mapa.key?nombre then mapa[nombre]=[hito.predecessor] else mapa[nombre] << hito.predecessor end }

  end
  def llena_destinos mapa
        self.data.relaciones_fin.each{|rel| nombre="#{dameNombreRelacionDestino(rel)}xxx#{rel.fin.id}" and if !mapa.key?nombre then mapa[nombre]=[rel.origen] else mapa[nombre] << rel.origen end }

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
    if self.data.class==Generica then llenaGenerica mapa end
    
     mapa.map{|k,v|  {:id => k.split("xxx")[1], :name => k.split("xxx")[0], :values=>dameValuesRelacionables(v) }}
     
    #mapa.each { |atr|  {:id => atr.to_s, :name => atr, :values=>dameValuesRelacionables(mapa[atr]) } }
    # por cada atributo obtener los relacionables
    # el atributo es el nombre1 o nombre2 de la relacion.sentido_relacion.nombre_relacion segun su valor creciente del sentido
    
    
    #  atributos.each{|atri| }
    #value.labels.map { |mar| {:id => mar.id.to_s, :name => mar.nombre, :values=>dameValuesMuseos(mar)+dameValuesGenericas(mar)} }
    
  end
  
   def dameValuesRelacionables lista
    lista.map { |relacionable| {:name=>relacionable.heir.nombre_ask,:id=>relacionable.id}}
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