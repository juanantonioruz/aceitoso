class CaminoRelacionsController < ApplicationController
  include ModuloRelaciones
   def create
     crea "relacion_museo_entorno_camino", "camino"
    end
    
     def destroy
       destruye "relacion_museo_entorno_camino"
     end

end
