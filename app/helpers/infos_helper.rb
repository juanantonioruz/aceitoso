module InfosHelper
  
  def dameTiposRI
    %w{panel video interactivo maqueta}
  end
  
    def titulo(info)
     if info.url.to_i!=0
          "#{Generica.find_by_id(info.url.to_i).titulo}"
        else
           return "Sin articulo asociado. Id: #{info.id}"
      end
    end
    def url(info)
        if !info.url==''     
            generica=Generica.find(info.url)
            return link_to(generica.titulo,generica_path(generica))
       else 
            return ''
        end
    end
end
