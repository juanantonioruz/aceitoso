class MuseoRelacionsController < ApplicationController
  include ModuloRelaciones
   def create
     crea "relacion_museo", "museo"
    end
    
     def destroy
       destruye "relacion_museo"
     end

end
