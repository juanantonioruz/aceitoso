class Espacio < ActiveRecord::Base
    mount_uploader :imagen,ImagenUploader
    belongs_to :museo
  acts_as_heir_of :relacionable
      
      
      def nombre_ask
        nombre
    end
    
    def nombre_select
"#{self.class}: #{nombre}"

end

def nombre_relacionable
nombre_select
end

end
