class SentidoRelacion < ActiveRecord::Base
      belongs_to :nombre_relacion
      has_many :relaciones,:dependent=>:destroy, :class_name => "Relacion"

end
