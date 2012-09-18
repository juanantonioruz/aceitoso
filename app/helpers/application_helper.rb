# encoding: utf-8
require 'htmlentities'
module ApplicationHelper

  def get_enlaces id, clase
enlaces={}
   ## if @enlaces=={} then
     # Relacionable.find(:all).map{|r| @@enlaces[r.nombre_relacionable]=r.id}
     Museo.order("CHAR_LENGTH(nombre_corto)").find(:all).map do |r| 
      if clase==Museo && r.id!=id
       enlaces[r.nombre_corto]=r.predecessor.id 
        end
     end
     Generica.order("CHAR_LENGTH(titulo)").find(:all).map do |r|
if clase==Generica && r.id!=id
 enlaces[r.titulo]=r.predecessor.id
end
end
     Hito.order("CHAR_LENGTH(nombre)").find(:all).map do |r| 
if clase==Hito && r.id!=id
enlaces[r.nombre]=r.predecessor.id
end
end
  ##  end
   enlaces=enlaces.sort_by {|x,y | x.length}
      return enlaces
  end
  def reset_enlaces
    enlaces={}
  end

    def texto_con_enlaces texto, id_actual, clase
      ocurrencias=[]
      get_enlaces(id_actual, clase).reverse_each do |e,v|
      coder = HTMLEntities.new


      pepe=coder.encode(e, :named)
        
      res=texto.gsub!(/\b#{pepe}\b/im, "**"+ocurrencias.size.to_s+"**")
        if res!=nil 
            ocurrencias<<[v, pepe]
         end
        
       
      end
        
      ocurrencias.each_with_index do |val, index|
        res=texto.gsub!(/\*\*#{index}\*\*/, " <a href='#' onclick='circles(#{val[0]})'>#{val[1]}</a>")
        end

      puts texto
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
