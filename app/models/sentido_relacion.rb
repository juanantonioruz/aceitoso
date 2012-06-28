class SentidoRelacion < ActiveRecord::Base
      belongs_to :nombre_relacion
      has_many :relaciones,:dependent=>:destroy, :class_name => "Relacion"


    def titulo
      logger.info(creciente)
      if(creciente.to_s=="1")
      logger.info("+++++++++++++++++++++++++++++++++++++++++++++++ self.creciente")
        return "> #{nombre_relacion.nombre1} > "
      else
      logger.info("-------------------------------------- self.decreciente")
        return "> #{nombre_relacion.nombre2} > "
    end
    
    end
    def titulo_destino
      logger.info(creciente)
      if(creciente.to_s=="1")
      logger.info("+++++++++++++++++++++++++++++++++++++++++++++++ self.creciente")
        return "> #{nombre_relacion.nombre2} > "
      else
      logger.info("-------------------------------------- self.decreciente")
        return "> #{nombre_relacion.nombre1} > "
    end
    
    end

    def titulo_desde_destino
      logger.info(creciente)
      if(creciente.to_s=="0")
      logger.info("+++++++++++++++++++++++++++++++++++++++++++++++ self.creciente")
        return "> #{nombre_relacion.nombre2} > "
      else
      logger.info("-------------------------------------- self.decreciente")
        return "> #{nombre_relacion.nombre1} > "
    end
    end
    
    def titulo_destino_desde_destino
        titulo_destino.gsub(">", "").lstrip.rstrip
    
    end
end
