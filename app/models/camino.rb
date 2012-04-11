class Camino < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  belongs_to :entorno
  belongs_to :museo
  has_many :coordenadas,:dependent=>:destroy
end
