class DatosSearch
  attr_accessor  :data_museos,:data_genericas,:data_piezas,:data_hitos,:data_caminos, :resultado_html
    def as_json(options = {})
    {
    :result=>dameMuseos+dameGenericas+dameHitos+dameCaminos
    }
  end
  def generaArrayInterpretable valor
        resp=valor.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
  end
  def dameMuseos
    generaArrayInterpretable data_museos
  end
  def damePiezas
    generaArrayInterpretable data_piezas
  end
  def dameHitos
    generaArrayInterpretable data_hitos
  end
  def dameCaminos
      generaArrayInterpretable data_caminos
  end
  def dameGenericas
    generaArrayInterpretable data_genericas
  end

end
