class PiezaRelacionsController < ApplicationController
  include ModuloRelaciones
   def create
     crea "relacion_museo_pieza" ,"pieza" 
    end
    
     def destroy
       destruye "relacion_museo_pieza"
     end

end
