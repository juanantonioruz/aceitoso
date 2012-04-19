class InfoRelacionsController < ApplicationController
  include ModuloRelaciones
   def create
     crea "relacion_museo_info"
    end
    
     def destroy
       destruye "relacion_museo_info"
     end

end
