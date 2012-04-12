class Pieza < ActiveRecord::Base
 

  mount_uploader :imagen,ImagenUploader
  belongs_to :museo
  has_and_belongs_to_many :labels,:join_table=>'piezas_labels'

  def escoleccion
    if self.coleccion
        'Si'
    else
        'No'
    end
  end
end
