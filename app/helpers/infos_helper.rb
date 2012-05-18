module InfosHelper
  
  def dameTiposRI
    %w{panel video interactivo maqueta}
  end
  
    def titulo(info)
     if !info.generica.nil?
          "#{info.generica.titulo}"
        else
           return "Sin articulo asociado. Id: #{info.id}"
      end
    end
    def url(info)
        if !info.generica.nil?
            return link_to(info.generica.titulo,generica_path(info.generica))
       else 
            return ''
        end
    end
end
