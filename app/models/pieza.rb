class Pieza < ActiveRecord::Base
 

  mount_uploader :imagen,ImagenUploader
  belongs_to :museo
  has_and_belongs_to_many :labels,:join_table=>'piezas_labels'
  acts_as_heir_of :relacionable

  def escoleccion
    if self.coleccion
        'Si'
    else
        'No'
    end
  end
  

  def nombre_select
    "#{self.class}: #{nombre}"    
  end

  def nombre_relacionable
    nombre
  end

end
