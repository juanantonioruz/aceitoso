class Generica < ActiveRecord::Base

    include ActionView::Helpers::SanitizeHelper

    mount_uploader :imagen,ImagenUploader
    mount_uploader :archivo,DocumentoUploader
   has_and_belongs_to_many :labels,:join_table=>'genericas_labels'

  has_many :pieza_genericas
  has_many :piezas, :through => :pieza_genericas
  has_many :camino_genericas
  has_many :caminos, :through => :camino_genericas
  has_many :hito_genericas
  has_many :hitos, :through => :hito_genericas

    has_many :infos

    acts_as_heir_of :relacionable


    def etiquetas
       self.labels.collect { |l| l.nombre+' ' } 
    end
   
   def nombre_select
    "Articulo: #{titulo}"    
  end
  def nombre_relacionable
    titulo
  end

  def nombre_ask
    "#{titulo}"    
  end

def desc_san
    sanitize(descripcion, :tags=>[])  
end


end
