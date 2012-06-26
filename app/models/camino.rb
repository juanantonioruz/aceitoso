class Camino < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  mount_uploader :archivo,DocumentoUploader
  belongs_to :entorno
  belongs_to :museo
  #has_many :coordenadas,:dependent=>:destroy
  has_and_belongs_to_many :labels,:join_table=>'caminos_labels'

  has_many :camino_genericas
  has_many :genericas, :through => :camino_genericas

  acts_as_heir_of :relacionable


def nombre_select
"Ruta: #{nombre}"

end

def nombre_relacionable
nombre
end

  def nombre_ask
    "#{nombre}"    
  end


end
