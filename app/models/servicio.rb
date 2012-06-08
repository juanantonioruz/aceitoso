class Servicio < ActiveRecord::Base
  belongs_to :museo
  belongs_to :service

  def imagen
    if self.service!=nil
        return self.service.imagen
    else
        return ""
    end
  end
end
