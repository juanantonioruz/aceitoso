class GenericaRelacionsController < ApplicationController
  include ModuloRelaciones
   def create
     crea "generica"
    end
    
     def destroy
       destruye "generica"
     end

end
