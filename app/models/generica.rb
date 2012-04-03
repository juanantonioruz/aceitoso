class Generica < ActiveRecord::Base
    mount_uploader :imagen,ImagenUploader
    has_and_belongs_to_many :labels
end
