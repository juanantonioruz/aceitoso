module ApplicationHelper
@@enlaces={}

  def get_enlaces
    if @@enlaces=={} then
     # Relacionable.find(:all).map{|r| @@enlaces[r.nombre_relacionable]=r.id}
     Museo.find(:all).map do |r| 
       @@enlaces[r.nombre]=r.predecessor.id 
     end
     Generica.find(:all).map{|r| @@enlaces[r.titulo]=r.predecessor.id}
     Hito.find(:all).map{|r| @@enlaces[r.nombre]=r.predecessor.id}
    end
      return @@enlaces
  end
  def reset_enlaces
    @@enlaces={}
  end

    def texto_con_enlaces texto
      get_enlaces.each{|e,v| texto.gsub!(/[^"\\]\b#{e}[^"\\]/im, " <a href='#' onclick='circles(#{v})'>\"#{e}\"</a> ")}
      texto
    end


    def imagentam(modelo,tam)
        if modelo.imagen_url.to_s!='' 
            return image_tag(modelo.imagen_url.to_s,:size=>tam)
        else
            return ''
        end
    end
    def imagen_ritam(modelo,tam)
        if modelo.imagen_ri_url.to_s!='' 
            return image_tag(modelo.imagen_ri_url.to_s,:size=>tam)
        else
            return ''
        end
    end
    def imagen(modelo)
        if modelo.imagen_url.to_s!='' 
            return image_tag(modelo.imagen_url.to_s)
        
        else
            return ''
        end
    end
    def alerta(tipo,aviso)
        render :partial=>'shared/alerta',:locals=>{:tipo=>tipo,:aviso=>aviso}
        #Tres tipos disponibles: info warning error

    end
    def etiquetar(modelo)
          render :partial=>'shared/tags',:locals=>{:modelo=>modelo}
          ## Permite incluir el campo de formulario para cualquier modelo que tenga la relacion hbtm
    end
    def etiquetas(modelo)
         render :partial=>'shared/etiquetas',:locals=>{:modelo=>modelo}
    end
    def cargaeditor
        render 'shared/editor'

        ## LLamar al metodo, luego a las textarea :class => "tinymce"
    end
end
