class Espacio < ActiveRecord::Base
    mount_uploader :imagen,ImagenUploader
    belongs_to :museo
      has_and_belongs_to_many :labels
      
      
      def nombre_ask
        nombre
      end
end
