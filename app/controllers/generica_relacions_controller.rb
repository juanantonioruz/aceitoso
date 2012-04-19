class GenericaRelacionsController < ApplicationController
  include ModuloRelaciones
   def create
     crea "relacion_generica"
    end
    
     def destroy
       destruye "relacion_generica"
     end

end
