class Relacionable < ActiveRecord::Base
  attr_accessor :nombre
          acts_as_predecessor :exposes=>:nombre_select, :exposes=>:nombre_ask, :exposes=>:nombre_relacionable

       has_many :relaciones_origen,:dependent=>:destroy,:class_name => "Relacion", :foreign_key=>"origen_id"
       has_many :relaciones_fin,:dependent=>:destroy, :class_name => "Relacion", :foreign_key=>"fin_id"

  def nombre_select
    heir.nil?? "#{id} - #{heir_type} nulo" : "#{heir.nombre_select}"
  end

def nombre_relacionable
  heir.nombre_relacionable
end
end
