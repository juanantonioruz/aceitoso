class Relacionable < ActiveRecord::Base
          acts_as_predecessor

       has_many :relaciones_origen,:dependent=>:destroy,:class_name => "Relacion", :foreign_key=>"origen_id"
       has_many :relaciones_fin,:dependent=>:destroy, :class_name => "Relacion", :foreign_key=>"fin_id"

end
