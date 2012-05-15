class DatosSearch
  attr_accessor  :data_museos,:data_genericas,:data_piezas,:data_hitos,:data_caminos, :resultado_html
    def as_json(options = {})
    {
    :result=>dameMuseos+dameGenericas+dameHitos+dameCaminos
    }
  end
  def dameMuseos
    resp=self.data_museos.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
    print resp.class
    resp
  end
  def damePiezas
    resp=self.data_piezas.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
    print resp.class
    resp
  end
  def dameHitos
    resp=self.data_hitos.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
    print resp.class
    resp
  end
  def dameCaminos
    resp=self.data_caminos.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
    print resp.class
    resp
  end
  def dameGenericas
    resp=self.data_genericas.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
    print resp.class
    resp
  end

end
