class Urbano < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  belongs_to :entorno
  belongs_to :museo
  has_and_belongs_to_many :labels,:join_table=>'urbanos_labels'
end
