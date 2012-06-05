class DatosSearch
  attr_accessor  :data_museos,:data_genericas,:data_hitos,:data_caminos, :data_museos_desc,:data_genericas_desc,:data_hitos_desc,:data_caminos_desc,
  :resultado_html
    def as_json(options = {})
    {
    :result=>dameMuseos+dameGenericas+dameHitos+dameCaminos+dameMuseos(true)+dameGenericas(true)+dameHitos(true)+dameCaminos(true)
    }
  end
  def generaArrayInterpretable valor
        resp=valor.map {|mar| {"mid" => mar.predecessor.id.to_s, "name" => mar.nombre_select, "notable"=>'aa'} }
  end
  def dameMuseos (valor=false)
    if valor then
    generaArrayInterpretable data_museos_desc
      else
    generaArrayInterpretable data_museos
    end
  end
 
  def dameHitos (valor=false)
        if valor then
    generaArrayInterpretable data_hitos_desc
  else
    generaArrayInterpretable data_hitos

    end
  end
  def dameCaminos (valor=false)
            if valor then
      generaArrayInterpretable data_caminos_desc
else
      generaArrayInterpretable data_caminos
  end
  end
  def dameGenericas (valor=false)
            if valor then
    generaArrayInterpretable data_genericas_desc
else
    generaArrayInterpretable data_genericas
  end
  end

end
