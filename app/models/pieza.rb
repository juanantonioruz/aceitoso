class Pieza < ActiveRecord::Base
    
      has_and_belongs_to_many :labels

  mount_uploader :imagen,ImagenUploader
  belongs_to :museo

  def escoleccion
    if self.coleccion
        'Sí'
    else
        'No'
    end
  end
end
