class SentidoRelacionDecreciente < SentidoRelacion
     after_initialize :init

    def init
      self.creciente=false
    end
    
  end
