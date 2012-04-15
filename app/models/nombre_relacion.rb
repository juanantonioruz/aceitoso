class NombreRelacion < ActiveRecord::Base
      has_many :sentidos,:dependent=>:destroy, :class_name => "SentidoRelacion"

end
