class Pieza < ActiveRecord::Base
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
