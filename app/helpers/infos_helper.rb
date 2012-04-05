module InfosHelper
    def titulo(info)
      generica=Generica.find(info.url)
      return generica.titulo
    end
    def url(info)
      generica=Generica.find(info.url)
      return link_to(generica.titulo,generica_path(generica))
    end
end
