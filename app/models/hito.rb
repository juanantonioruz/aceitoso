class Hito < ActiveRecord::Base
  mount_uploader :imagen,ImagenUploader
  belongs_to :entorno
  belongs_to :museo
    belongs_to :service

  has_many :hito_genericas
  has_many :genericas, :through => :hito_genericas

  acts_as_heir_of :relacionable
 def imagen
    if self.service!=nil
        return self.service.imagen
    else
        return ""
    end
  end
def nombre_select
"#{self.class}: #{nombre}"

end

def nombre_relacionable
nombre_select
end
  def nombre_ask
    "#{nombre}"    
  end


end
