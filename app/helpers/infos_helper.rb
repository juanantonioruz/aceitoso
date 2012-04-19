module InfosHelper
  
  def dameTiposRI
    %w{panel video interactivo maqueta}
  end
  
    def titulo(info)
     if !info.url==''
       generica=Generica.find(info.url)    
        return generica.titulo
        else
           'Sin noticia'
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
