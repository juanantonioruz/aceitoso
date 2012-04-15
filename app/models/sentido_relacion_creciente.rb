class SentidoRelacionCreciente < SentidoRelacion

     after_initialize :init

    def init
      self.creciente=true
    end

end
