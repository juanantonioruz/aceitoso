class Service < ActiveRecord::Base
      mount_uploader :imagen,ImagenUploader
      has_many :servicios
end
