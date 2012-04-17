class Generica < ActiveRecord::Base
    
    mount_uploader :imagen,ImagenUploader
    has_and_belongs_to_many :labels,:join_table=>'genericas_labels'

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

end
